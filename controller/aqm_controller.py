'''
This is a free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Air Quality Monitor is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with This software.  If not, see <https://www.gnu.org/licenses/>.
'''

import struct
import time

from absl import flags, logging
from datetime import date, datetime
from pygatt.backends.gatttool.gatttool import GATTToolBackend
from pygatt.backends.gatttool.device import GATTToolBLEDevice
from pygatt_simulate import MockGATTToolBLEDevice, MockGATTToolBackend
from retry import retry
from threading import Thread
from typing import List, Optional, Union

from aqm_config_manager import AqmConfigManager
from aqm_data_manager import AqmDataManager


FLAGS = flags.FLAGS

flags.DEFINE_string('device_name', 'AQ_BLE',
                    'Name of the device to connect.')
flags.DEFINE_boolean('ble_emulation', False, 'If set, the app will not try to '
                     'connect to the BLE stack')
flags.DEFINE_boolean('scan_after_disconnect', False,
                     'If set, after every disconnection the device will '
                     'perform a scan. Otherwise it will try to reconnect to '
                     'the same MAC.')

PM1_UUID = '00e55001-e229-4d47-ac2d-59871700c944'
PM25_UUID = '00e55002-e229-4d47-ac2d-59871700c944'
PM10_UUID = '00e55003-e229-4d47-ac2d-59871700c944'
TEMP_UUID = '00e55004-e229-4d47-ac2d-59871700c944'
HUM_UUID = '00e55005-e229-4d47-ac2d-59871700c944'
PRESS_UUID = '00e55006-e229-4d47-ac2d-59871700c944'
CONFIG_UUID = '00e55007-e229-4d47-ac2d-59871700c944'


HANDLE_METADATA = {
    PM1_UUID:    {'name': 'PM 1.0', 'format': '<I',
                  'unit': 'ug/m3', 'property': 'pm1'},
    PM25_UUID:   {'name': 'PM 2.5', 'format': '<I',
                  'unit': 'ug/m3', 'property': 'pm25'},
    PM10_UUID:   {'name': 'PM 10', 'format': '<I',
                  'unit': 'ug/m3', 'property': 'pm10'},
    TEMP_UUID:   {'name': 'Temperature', 'format': '<f',
                  'unit': 'C', 'property': 'temp'},
    HUM_UUID:    {'name': 'Humidity', 'format': '<f',
                  'unit': '%', 'property': 'hum'},
    PRESS_UUID:  {'name': 'Pressure', 'format': '<f',
                  'unit': 'Pa', 'property': 'bmp'},
}


class NoScanException(Exception):
    pass


class AqmController(object):
    def __init__(self,
                 config_manager: AqmConfigManager,
                 data_manager: AqmDataManager):

        self._config_manager: AqmConfigManager = config_manager
        self._data_manager: AqmDataManager = data_manager
        self._adapter: Union[GATTToolBackend,
                             MockGATTToolBackend] = None
        self._device: Union[GATTToolBLEDevice, MockGATTToolBLEDevice] = None
        self._mac: Optional[str] = None
        self._disconnect_events: int = 0
        self._last_disconnection: datetime = datetime.min

    def _scanForDevice(self) -> Optional[str]:
        if self._adapter is None:
            logging.error('Scan was called before connect.')
            return None
        else:
            devices = self._adapter.scan(timeout=10)
            for entry in devices:
                if entry.get('name', '') == FLAGS.device_name:
                    # Assumption that there's only one device with
                    # the expected name.
                    mac = entry.get('address')
                    logging.info('Found device %s' % mac)
                    return mac
            logging.warning(
                'Could not find expected device: %s', FLAGS.device_name)
        return None

    # Internal connection routines.
    @retry(delay=2, logger=logging.get_absl_logger())
    def _connectDevice(self, mac: str) -> bool:
        if self._device:
            logging.warning('Internal _connectDevice called while another '
                            'device is already connected')
        return self._adapter.connect(mac, timeout=10, auto_reconnect=True)

    # We don't use this routine, Pygatt has an automatic reconeect feature
    # that works better.
    def _disconnectCb(self, handle):
        logging.warning('Disconnection from %s', self._mac)
        if FLAGS.scan_after_disconnect:
            self._adapter.stop()
            self._device = None
            self._mac = None
            self._adapter.start()
            self.connect()
        else:
            logging.info("Connection lost. Reconnecting...")
            reconnect_thread = Thread(target=self._adapter.reconnect,
                                      args=(self._device, 10))
            reconnect_thread.start()

    def _disconnectCbLogOnly(self, handle):
        logging.warning('Disconnection from %s', self._mac)
        self._disconnect_events += 1
        self._last_disconnection = datetime.now()
        self._connected = False

    def _connectCb(self, handle):
        logging.info('Received connection event')
        self._connected = True

    # Internal functions hadling config changes.

    @retry(delay=2, tries=5)
    def _readCurrentConfig(self):
        value = (self._device.char_read(CONFIG_UUID))
        logging.info('Read config: %s', ''.join(
            '{:02x}'.format(x) for x in value))
        self._config_manager.remote_config = value

    def _configChanged(self, handle, value):
        logging.info('Received new config: %s', ''.join(
            '{:02x}'.format(x) for x in value))
        self._config_manager.remote_config = value

    # Internal functions handling data value changes.
    def _valuesChanged(self, handle, property_id, value):
        # struct.unpack() returns a tuple, even if there's only
        # one value.
        data = struct.unpack(
            HANDLE_METADATA[property_id]['format'], value)[0]
        logging.info("New reading: %s %s %s",
                     HANDLE_METADATA[property_id]['name'],
                     data, HANDLE_METADATA[property_id]['unit'])
        setattr(self._data_manager,
                HANDLE_METADATA[property_id]['property'], data)

    def _subscribeToValues(self):
        if self._device is None:
            logging.error(
                'Cannot read values since the device is not connected')
            return
        for property_id in HANDLE_METADATA.keys():
            logging.info('subscribing to %s', property_id)
            self._device.subscribe(
                property_id,
                callback=lambda handle, value, property_id=property_id:
                    self._valuesChanged(
                        handle, property_id, value))

    def _readValues(self):
        if self._device is None:
            logging.error(
                'Cannot read values since the device is not connected')
            return

        for property_id in HANDLE_METADATA.keys():
            logging.info('Reading values for %s', property_id)
            value = self._device.char_read(property_id)
            unpacked_data = struct.unpack(
                HANDLE_METADATA[property_id]['format'], value)[0]
            logging.info("Reading: %s %s %s",
                         HANDLE_METADATA[property_id]['name'],
                         unpacked_data,
                         HANDLE_METADATA[property_id]['unit'])
            setattr(self._data_manager,
                    HANDLE_METADATA[property_id]['property'], unpacked_data)

    # Public functions.
    # Retry public connect() only if scanning doesn't return a candidate.
    # If a candidate is found, connection errors will be handled by the
    # internal connect thread.
    @ retry(NoScanException, delay=2)
    def connect(self) -> bool:
        if self._adapter is None:
            # If adapter isn't connected whatever is there is stale.
            self._device = None
            logging.info('Setting up adapter')
            if FLAGS.ble_emulation:
                self._adapter = MockGATTToolBackend()
            else:
                self._adapter = GATTToolBackend()
            try:
                self._adapter.start()
            except Exception as e:
                logging.exception('Error while initializing the BLE adapter')
                self._adapter = None
                # This exception doesn't cause a retry.
                raise e
        else:
            logging.warning('Connect called but adapter is already set')

        if self._mac is None:
            self._mac = self._scanForDevice()

        if self._device is not None:
            logging.warning('Connect called but device is already set')
            return False

        if self._mac:
            self._device = self._connectDevice(self._mac)
            if self._device is not None:
                self._device.register_disconnect_callback(
                    lambda handle: self._disconnectCbLogOnly(handle))
                self._device.register_connect_callback(
                    lambda handle: self._connectCb(handle))
                self._connected = True
                self._readCurrentConfig()
                self._device.subscribe(
                    CONFIG_UUID,
                    callback=(
                        lambda handle, value: self._configChanged(
                            handle, value)))
            else:
                return False
            try:
                logging.info('Reading values upon first connection')
                self._readValues()
            except Exception:
                # Too bad, but we will get the subscriptions, so it shouldn't
                # be a gigantic problem.
                logging.exception('Error while reading values')
            finally:
                self._subscribeToValues()
                return True
        else:
            raise NoScanException(
                'Scanning for devices, cannot find %s' % FLAGS.device_name)

    def pushNewConfig(self, new_config: List[int]) -> bool:
        if self._device is None:
            logging.warning('Cannot push new config, device is not connected')
            return False

        self._device.char_write(CONFIG_UUID, new_config,
                                wait_for_response=False)
        return True

    def simulate(self):
        if FLAGS.ble_emulation:
            self._device.simulate()
        else:
            logging.warning('Simulation not available')

    def stopSimulation(self):
        if FLAGS.ble_emulation:
            self._device.stopSimulation()
