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

from absl import logging
from enum import IntEnum, unique


'''
The following classes must match the Enums in the Arduino code.
'''


@unique
class BLEDataModes(IntEnum):
    BLE_SEND_NEVER = 0
    BLE_SEND_ALWAYS = 1
    BLE_SEND_ON_CHANGE = 2

    @staticmethod
    def toString(code):
        if code == BLEDataModes.BLE_SEND_NEVER:
            return 'Never'
        if code == BLEDataModes.BLE_SEND_ALWAYS:
            return 'Always'
        if code == BLEDataModes.BLE_SEND_ON_CHANGE:
            return 'Send on Change'
        return 'Unknown'


@unique
class PmSensorModes(IntEnum):
    PM_SENSOR_ALWAYS_OFF = 0
    PM_SENSOR_ALWAYS_ON = 1
    PM_SENSOR_15M = 2

    @staticmethod
    def toString(code):
        if code == PmSensorModes.PM_SENSOR_ALWAYS_OFF:
            return 'Always OFF'
        if code == PmSensorModes.PM_SENSOR_ALWAYS_ON:
            return 'Always ON'
        if code == PmSensorModes.PM_SENSOR_15M:
            return '15 Min intervals'
        return 'Unknown'


@unique
class FanModes(IntEnum):
    FAN_MODE_OFF = 0
    FAN_MODE_ON = 1
    FAN_MODE_PM_SYNC = 2
    FAN_MODE_10_MINS = 3

    @staticmethod
    def toString(code):
        if code == FanModes.FAN_MODE_OFF:
            return 'OFF'
        if code == FanModes.FAN_MODE_ON:
            return 'ON'
        if code == FanModes.FAN_MODE_PM_SYNC:
            return 'PM Sync'
        if code == FanModes.FAN_MODE_10_MINS:
            return '10 Min Dutycycle'
        return 'Unknown'


@unique
class LcdBlModes(IntEnum):
    LCD_BL_ON = 0
    LCD_BL_OFF = 1
    LCD_BL_5S = 2
    LCD_BL_10S = 3

    @staticmethod
    def toString(code):
        if code == LcdBlModes.LCD_BL_ON:
            return 'ON'
        if code == LcdBlModes.LCD_BL_OFF:
            return 'OFF'
        if code == LcdBlModes.LCD_BL_5S:
            return '5s'
        if code == LcdBlModes.LCD_BL_10S:
            return '10s'
        return 'Unknown'


@unique
class Views(IntEnum):
    VISUALIZATION_PM_DATA = 0
    VISUALIZATION_PM_HIST = 1
    VISUALIZATION_TEMP_HUM = 2
    VISUALIZATION_CONFIGS = 3
    VISUALIZATION_STATE = 4

    @staticmethod
    def toString(code):
        if code == Views.VISUALIZATION_PM_DATA:
            return 'Data'
        if code == Views.VISUALIZATION_PM_HIST:
            return 'Histogram'
        if code == Views.VISUALIZATION_TEMP_HUM:
            return 'Temp/Hum'
        if code == Views.VISUALIZATION_CONFIGS:
            return 'Configurations'
        if code == Views.VISUALIZATION_STATE:
            return 'State'
        return 'Unknown'


# Encodes/Decode the current config in a 4-byte bitset to be sent over BLE or
# stored in EEPROM
# The format must be identical to that used in the Arduino code.
#  --------------------------------------------------------------------------------------------------------------
# | Byte 4  |      Byte 3       |                    byte  2               |              byte 1                 |
#  --------------------------------------------------------------------------------------------------------------
# |  8 - 0  |  8 - 3 |   2 - 0  |   7 - 6 |   5   | 4 - 3    |     2 - 0   |    7 - 5   |     4  |    3 - 0      |
#  --------------------------------------------------------------------------------------------------------------
# | UNUSED  | UNUSED | FAN_MODE | UNUSED  | AU_SC | BLE_MODE | PM_DC_MODE  | LCD_BL_MODE| UNUSED | VISUALIZATION |
#  --------------------------------------------------------------------------------------------------------------


def encodeConfigData(config_data):
    byte_1 = ((config_data.get('visualization', 0) & 0xF) |
              (0 << 4) |
              ((config_data.get('lcd_bl_mode', 0) & 0x7) << 5))
    byte_2 = ((config_data.get('pm_dc_mode', 0) & 0x7) |
              ((config_data.get('ble_data_mode', 0) & 0x3) << 3) |
              (config_data.get('auto_scroll', false) << 5))
    byte_3 = (conifg_data.get('fan_mode', 0) & 0x7)
    byte_4 = 0
    return [byte_1, byte_2, byte_3, byte_4]


def decodeConfigData(encoded_config_data, local_change=False):
    byte_1 = encoded_config_data[0]
    byte_2 = encoded_config_data[1]
    byte_3 = encoded_config_data[2]
    res = {}
    res['visualization'] = (
        byte_1 & 0xF,
        Views.toString(byte_1 & 0xF)
    )
    res['lcd_bl_mode'] = (
        (byte_1 >> 5) & 0x7,
        LcdBlModes.toString((byte_1 >> 5) & 0x7)
    )
    res['pm_dc_mode'] = (
        byte_2 & 0x7,
        PmSensorModes.toString(byte_2 & 0x7)
    )
    res['ble_data_mode'] = (
        (byte_2 >> 3) & 0x3,
        BLEDataModes.toString((byte_2 >> 3) & 0x3)
    )
    res['auto_scroll'] = (
        (byte_2 >> 5) & 0x1,
        ('ON' if (byte_2 >> 5) else 'OFF')
    )
    res['fan_mode'] = (
        byte_3 & 0x7,
        FanModes.toString(byte_3 & 0x7)
    )
    res['config_changed_locally'] = local_change
    return res


def printConfigData(config_data):
    logging.info('-----------------')
    logging.info('  Config:')
    logging.info('-----------------')
    logging.info('Visualization: %s' %
                 config_data.get('visualization', [-1, 'Unknown'])[1])
    logging.info('Fan Mode: %s' %
                 config_data.get('fan_mode', [-1, 'Unknown'])[1])
    logging.info('LCD Mode: %s' %
                 config_data.get('lcd_bl_mode', [-1, 'Unknown'])[1])
    logging.info('PM Mode: %s' %
                 config_data.get('pm_dc_mode', [-1, 'Unknown'])[1])
    logging.info('BLE Data Mode: %s' %
                 config_data.get('ble_data_mode', [-1, 'Unknown'])[1])
    logging.info('Auto Scroll: %s' %
                 ('ON' if config_data.get('auto_scroll', False) else 'OFF'))


class AqmConfigManager(object):
    def __init__(self):
        self._current_config = {}

    def recordNewConfig(self, new_config_value):
        self._current_config = decodeConfigData(new_config_value)
        logging.info('Received new Configuration value %s' %
                     ''.join('{:02x}'.format(x) for x in new_config_value))
        print(self._current_config)
        printConfigData(self._current_config)

    def getCurrentConfig(self):
        return self._current_config

    def getEncodedCurrentConfig(self):
        return encodeConfigData(self._current_config)
