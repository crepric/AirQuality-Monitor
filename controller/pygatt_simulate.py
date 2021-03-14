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

import random
import struct

from absl import flags, logging
from aqm_config_manager import Config, BLEDataModes, PmSensorModes, FanModes
from aqm_config_manager import LcdBlModes, AutoScroll, Views, encodeConfigData
from threading import Thread, Event
from typing import List

FLAGS = flags.FLAGS

PM1_UUID = '00e55001-e229-4d47-ac2d-59871700c944'
PM25_UUID = '00e55002-e229-4d47-ac2d-59871700c944'
PM10_UUID = '00e55003-e229-4d47-ac2d-59871700c944'
TEMP_UUID = '00e55004-e229-4d47-ac2d-59871700c944'
HUM_UUID = '00e55005-e229-4d47-ac2d-59871700c944'
PRESS_UUID = '00e55006-e229-4d47-ac2d-59871700c944'
CONFIG_UUID = '00e55007-e229-4d47-ac2d-59871700c944'

DEFAULT_DATA = {
    PM1_UUID: struct.pack('<I', 15),
    PM25_UUID: struct.pack('<I', 20),
    PM10_UUID: struct.pack('<I', 25),
    TEMP_UUID: struct.pack('<f', 21.4),
    HUM_UUID: struct.pack('<f', 67.44),
    PRESS_UUID: struct.pack('<f', 101453.32),
}


class SimulateDataThread(Thread):
    def __init__(self, event, device):
        Thread.__init__(self)
        self._stopped = event
        self._device = device

    def run(self):
        while not self._stopped.is_set():
            logging.info('Simulation thread running')
            self._device.temp = self._device.sendNewData(
                TEMP_UUID,
                struct.pack('<f', random.uniform(-10, 45)))
            self._device.hum = self._device.sendNewData(
                HUM_UUID,
                struct.pack('<f', random.uniform(0, 100)))
            self._device.bmp = self._device.sendNewData(
                PRESS_UUID,
                struct.pack('<f', random.randint(92000, 108000)))
            self._device.pm1 = self._device.sendNewData(
                PM1_UUID,
                struct.pack('<I', random.randint(0, 500)))
            self._device.pm25 = self._device.sendNewData(
                PM25_UUID,
                struct.pack('<I', random.randint(0, 500)))
            self._device.pm10 = self._device.sendNewData(
                PM10_UUID,
                struct.pack('<I', random.randint(0, 500)))
            self._stopped.wait(10)
        logging.info('Simulation thread finished')


class MockGATTToolBLEDevice:
    def register_disconnect_callback(self, cb):
        self._disconnect_cb = cb
        self._callbacks = {}

    def char_read(self, property_id: str) -> List[int]:
        if property_id == CONFIG_UUID:
            ret: Config = {
                'visualization': Views(1),
                'lcd_bl_mode': LcdBlModes(1),
                'pm_dc_mode': PmSensorModes(1),
                'ble_data_mode': BLEDataModes(1),
                'auto_scroll': AutoScroll(1),
                'fan_mode': FanModes(1),
            }
            return encodeConfigData(ret)
        if property_id in DEFAULT_DATA:
            return DEFAULT_DATA[property_id]

    def subscribe(self, handle: str, callback) -> None:
        self._callbacks[handle] = callback

    def sendNewData(self, property_id: str, encoded_value: List[int]) -> None:
        if property_id in self._callbacks:
            self._callbacks[property_id](None, encoded_value, property_id)

    def simulate(self):
        logging.info('Initiating data simulation')
        self._stop_simulation_event = Event()
        self._simulation_thread = SimulateDataThread(
            self._stop_simulation_event,
            self)
        self._simulation_thread.start()

    def stopSimulation(self):
        self._stop_simulation_event.set()

    def __getattr__(self, name):
        def method(*args, **kwargs):
            logging.info("tried to handle unknown method %s", name)
            if args:
                logging.info("it had arguments: %s", str(args))
            if kwargs:
                logging.info("it had keyword arguments: %s", str(kwargs))
        return method


class MockGATTToolBackend:

    def start(self):
        pass

    def scan(self, timeout=10):
        return [{'name': FLAGS.device_name,
                 'address': 'xx:xx:xx:xx:xx:xx'}]

    def connect(self, mac, timeout, auto_reconnect):
        return MockGATTToolBLEDevice()

    def __getattr__(self, name):
        def method(*args, **kwargs):
            logging.info("tried to handle unknown method %s", name)
            if args:
                logging.info("it had arguments: %s", str(args))
            if kwargs:
                logging.info("it had keyword arguments: %s", str(kwargs))
        return method
