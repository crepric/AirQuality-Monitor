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

import pygatt
import struct
import time

from absl import flags
from absl import logging
from retry import retry
from threading import Thread, Event

from aqm_data_manager import AqmDataManager


flags.DEFINE_string('device_name', 'AQ_BLE', 'Name of the device to connect.')
FLAGS = flags.FLAGS

PM1_UUID = '00e55001-e229-4d47-ac2d-59871700c944'
PM25_UUID = '00e55002-e229-4d47-ac2d-59871700c944'
PM10_UUID = '00e55003-e229-4d47-ac2d-59871700c944'
TEMP_UUID = '00e55004-e229-4d47-ac2d-59871700c944'
HUM_UUID = '00e55005-e229-4d47-ac2d-59871700c944'
PRESS_UUID = '00e55006-e229-4d47-ac2d-59871700c944'
CONFIG_UUID = '00e55007-e229-4d47-ac2d-59871700c944'


HANDLE_METADATA = {
    PM1_UUID:    {'name': 'PM 1.0', 'format': '<I',
                  'unit': 'ug/m3', 'setmethod': 'setPM1'},
    PM25_UUID:   {'name': 'PM 2.5', 'format': '<I',
                  'unit': 'ug/m3', 'setmethod': 'setPM25'},
    PM10_UUID:   {'name': 'PM 10', 'format': '<I',
                  'unit': 'ug/m3', 'setmethod': 'setPM10'},
    TEMP_UUID:   {'name': 'Temperature', 'format': '<f',
                  'unit': 'C', 'setmethod': 'setTemp'},
    HUM_UUID:    {'name': 'Humidity', 'format': '<f',
                  'unit': '%', 'setmethod': 'setHum'},
    PRESS_UUID:  {'name': 'Pressure', 'format': '<f',
                  'unit': '%', 'setmethod': 'setHum'},
}


class NoScanException(Exception):
    pass


class ReadThread(Thread):
    def __init__(self, event, controller):
        Thread.__init__(self)
        self._stopped = event
        self._controller = controller

    def run(self):
        while not self._stopped.wait(2):
            try:
                self._controller.readValues()
            except Exception:
                logging.exception('Error while reading values')


class AqmController(object):
    def __init__(self, config_manager, data_manager):
        self._config_manager = config_manager
        self._data_manager = data_manager
        self._adapter = None
        self._device = None
        self._mac = None

    def _scanForDevice(self):
        if self._adapter is None:
            logging.error('Scan was called before connect.')
            return None
        else:
            devices = self._adapter.scan(timeout=10)
            for entry in devices:
                if entry.get('name', '') == FLAGS.device_name:
                    mac = entry.get('address')
                    logging.info('Found device %s' % mac)
                    return mac
        return None

    @ retry(delay=2)
    def _connectDevice(self, mac):
        self._device = self._adapter.connect(mac, timeout=10)
        logging.info('Successfully conneted to %s' % mac)
        return True

    def _disconnectCb(self, handle):
        logging.warning('Disconnection from %s' % self._mac)
        self._adapter.stop()
        self._device = None
        self._mac = None
        self._adapter.start()
        self.connect()

    @ retry(delay=2, tries=5)
    def _readCurrentConfig(self):
        value = (self._device.char_read(CONFIG_UUID))
        self._config_manager.recordNewConfig(value)

    def _configChanged(self, handle, value):
        logging.info('new config: %s', ''.join(
            '{:02x}'.format(x) for x in value))
        self._config_manager.recordNewConfig(value)

    def _valuesChanged(self, handle, property_id, value):
        data = struct.unpack(
            HANDLE_METADATA[property_id]['format'], value)[0]
        logging.info("New reading: %s %s %s",
                     HANDLE_METADATA[property_id]['name'],
                     data, HANDLE_METADATA[property_id]['unit'])
        set_method = getattr(AqmDataManager,
                             HANDLE_METADATA[property_id]['setmethod'])
        set_method(self._data_manager, data)

    @ retry(NoScanException, delay=2)
    def connect(self):
        if self._adapter is None:
            # If adapter isn't connected whatever is there is stale.
            self_device = None
            logging.info('Setting up adapter')
            self._adapter = pygatt.GATTToolBackend()
            try:
                self._adapter.start()
            except Exception:
                logging.exception('Error while initializing the BLE adapter')
                self._adapter = None
        else:
            logging.warning('Connect called but adapter is already set')

        if self._device is None:
            self._mac = self._scanForDevice()
        else:
            logging.warning('Connect called but device is already set')
            return
        if self._mac:
            connected = self._connectDevice(self._mac)
            if connected:
                self._device.register_disconnect_callback(
                    lambda handle: self._disconnectCb(handle))
                self._readCurrentConfig()
#                self._device.char_write(CONFIG_UUID, [0x03, 0x12, 0x00, 0x00],
#                                        wait_for_response=False)
                time.sleep(1)
                self._device.subscribe(
                    CONFIG_UUID,
                    callback=(
                        lambda handle, value: self._configChanged(
                            handle, value)))
            try:
                logging.info('Reading values upon first connection')
                self.readValues()
            except Exception:
                logging.exception('Error while reading values')
            finally:
                self.subscribeToValues()
        else:
            raise NoScanException(
                'Scanning for devices, cannot find %s' % FLAGS.device_name)

    def subscribeToValues(self):
        if self._device is None:
            logging.error(
                'Cannot read values since the device is not connected')
            return
        for property_id in [PM1_UUID, PM25_UUID, PM10_UUID, TEMP_UUID, HUM_UUID]:
            self._device.subscribe(
                property_id,
                callback=lambda handle, value, property_id=property_id:
                    self._valuesChanged(
                        handle, property_id, value))
            time.sleep(1)

    def readValues(self):
        if self._device is None:
            logging.error(
                'Cannot read values since the device is not connected')
            return
        rawpm1 = self._device.char_read(PM1_UUID)
        rawpm25 = self._device.char_read(PM25_UUID)
        rawpm10 = self._device.char_read(PM10_UUID)
        rawtemp = self._device.char_read(TEMP_UUID)
        rawhum = self._device.char_read(HUM_UUID)
        rawpress = self._device.char_read(PRESS_UUID)

        pm1 = struct.unpack('<I', rawpm1)[0]
        pm25 = struct.unpack('<I', rawpm25)[0]
        pm10 = struct.unpack('<I', rawpm10)[0]
        temp = struct.unpack('<f', rawtemp)[0]
        hum = struct.unpack('<f', rawhum)[0]
        press = struct.unpack('<f', rawpress)[0]

        logging.info('Values read: PM-1: %d, PM-2.5: %d, PM10: %d, Temp: %f, Hum: %f, Press: %d',
                     pm1, pm25, pm10, temp, hum, press)

        self._data_manager.setTemp(temp)
        self._data_manager.setHum(hum)
        self._data_manager.setBmp(press)
        self._data_manager.setPM1(pm1)
        self._data_manager.setPM25(pm25)
        self._data_manager.setPM10(pm10)
