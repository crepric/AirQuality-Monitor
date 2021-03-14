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
from datetime import date, datetime
from enum import IntEnum, unique
from functools import wraps
from typing import TypedDict, List, Callable, Type

'''
The following classes must match the Enums in the Arduino code.
'''


class ConfigEnum(IntEnum):
    @classmethod
    def nice_name(cls) -> str:
        return "Not implemented"


@unique
class BLEDataModes(ConfigEnum):
    BLE_INVALID = -1
    BLE_SEND_NEVER = 0
    BLE_SEND_ALWAYS = 1
    BLE_SEND_ON_CHANGE = 2

    def __str__(self) -> str:
        if self.value == BLEDataModes.BLE_SEND_NEVER:
            return 'Never'
        if self.value == BLEDataModes.BLE_SEND_ALWAYS:
            return 'Always'
        if self.value == BLEDataModes.BLE_SEND_ON_CHANGE:
            return 'Send on Change'
        return 'Unknown'

    @classmethod
    def nice_name(cls) -> str:
        return "BLE Data Mode"


@unique
class PmSensorModes(ConfigEnum):
    PM_SENSOR_INVALID = -1
    PM_SENSOR_ALWAYS_OFF = 0
    PM_SENSOR_ALWAYS_ON = 1
    PM_SENSOR_15M = 2

    def __str__(self) -> str:
        if self.value == PmSensorModes.PM_SENSOR_ALWAYS_OFF:
            return 'Always OFF'
        if self.value == PmSensorModes.PM_SENSOR_ALWAYS_ON:
            return 'Always ON'
        if self.value == PmSensorModes.PM_SENSOR_15M:
            return '15 Min intervals'
        return 'Unknown'

    @classmethod
    def nice_name(cls) -> str:
        return "PM Sensor Mode"


@unique
class FanModes(ConfigEnum):
    FAN_MODE_INVALID = -1
    FAN_MODE_OFF = 0
    FAN_MODE_ON = 1
    FAN_MODE_PM_SYNC = 2
    FAN_MODE_10_MINS = 3

    def __str__(self) -> str:
        if self.value == FanModes.FAN_MODE_OFF:
            return 'OFF'
        if self.value == FanModes.FAN_MODE_ON:
            return 'ON'
        if self.value == FanModes.FAN_MODE_PM_SYNC:
            return 'PM Sync'
        if self.value == FanModes.FAN_MODE_10_MINS:
            return '10 Min Dutycycle'
        return 'Unknown'

    @classmethod
    def nice_name(cls) -> str:
        return "Fan Mode"


@unique
class LcdBlModes(ConfigEnum):
    LCD_BL_INVALID = -1
    LCD_BL_ON = 0
    LCD_BL_OFF = 1
    LCD_BL_5S = 2
    LCD_BL_10S = 3

    def __str__(self) -> str:
        if self.value == LcdBlModes.LCD_BL_ON:
            return 'ON'
        if self.value == LcdBlModes.LCD_BL_OFF:
            return 'OFF'
        if self.value == LcdBlModes.LCD_BL_5S:
            return '5s'
        if self.value == LcdBlModes.LCD_BL_10S:
            return '10s'
        return 'Unknown'

    @classmethod
    def nice_name(cls) -> str:
        return "LCD Backlight Mode"


@unique
class AutoScroll(ConfigEnum):
    AS_INVALID = -1
    AS_OFF = 0
    AS_ON = 1

    def __str__(self) -> str:
        if self.value == AutoScroll.AS_OFF:
            return 'OFF'
        if self.value == AutoScroll.AS_ON:
            return 'ON'
        return 'Unknown'

    @classmethod
    def nice_name(cls) -> str:
        return "Auto Scroll Mode"


@unique
class Views(ConfigEnum):
    VISUALIZATION_INVALID = -1
    VISUALIZATION_PM_DATA = 0
    VISUALIZATION_PM_HIST = 1
    VISUALIZATION_TEMP_HUM = 2
    VISUALIZATION_CONFIGS = 3
    VISUALIZATION_STATE = 4

    def __str__(self) -> str:
        if self.value == Views.VISUALIZATION_PM_DATA:
            return 'Data'
        if self.value == Views.VISUALIZATION_PM_HIST:
            return 'Histogram'
        if self.value == Views.VISUALIZATION_TEMP_HUM:
            return 'Temp/Hum'
        if self.value == Views.VISUALIZATION_CONFIGS:
            return 'Configurations'
        if self.value == Views.VISUALIZATION_STATE:
            return 'State'
        return 'Unknown'

    @classmethod
    def nice_name(cls) -> str:
        return "Visualization"


ALL_ENUMS: List[Type[ConfigEnum]] = [Views, LcdBlModes, PmSensorModes, BLEDataModes,
                                     AutoScroll, FanModes]

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


class Config(TypedDict):
    visualization: Views
    lcd_bl_mode: LcdBlModes
    pm_dc_mode: PmSensorModes
    ble_data_mode: BLEDataModes
    auto_scroll: AutoScroll
    fan_mode: FanModes


def defaultConfig() -> Config:
    ret: Config = {
        'visualization': Views(-1),
        'lcd_bl_mode': LcdBlModes(-1),
        'pm_dc_mode': PmSensorModes(-1),
        'ble_data_mode': BLEDataModes(-1),
        'auto_scroll': AutoScroll(-1),
        'fan_mode': FanModes(-1),
    }
    return ret


def encodeConfigData(config_data: Config) -> List[int]:
    byte_1 = ((config_data['visualization'].value & 0xF) |
              (0 << 4) |
              ((config_data['lcd_bl_mode'].value & 0x7) << 5))
    byte_2 = ((config_data['pm_dc_mode'].value & 0x7) |
              ((config_data['ble_data_mode'].value & 0x3) << 3) |
              (config_data['auto_scroll'].value << 5))
    byte_3 = config_data['fan_mode'].value & 0x7
    byte_4 = 0
    return [byte_1, byte_2, byte_3, byte_4]


def decodeConfigData(
        encoded_config_data: List[int]) -> Config:
    byte_1 = encoded_config_data[0]
    byte_2 = encoded_config_data[1]
    byte_3 = encoded_config_data[2]
    res = defaultConfig()
    res['visualization'] = Views(byte_1 & 0xF)
    res['lcd_bl_mode'] = LcdBlModes((byte_1 >> 5) & 0x7)
    res['pm_dc_mode'] = PmSensorModes(byte_2 & 0x7)
    res['ble_data_mode'] = BLEDataModes((byte_2 >> 3) & 0x3)
    res['auto_scroll'] = AutoScroll(((byte_2 >> 5) & 0x1))
    res['fan_mode'] = FanModes(byte_3 & 0x7)
    return res


def recordTime(func: Callable):
    @wraps(func)
    def FuncWithRecordedTime(self, *args, **kwargs):
        self._last_remote_update = datetime.now()
        func(self, *args, **kwargs)
    return FuncWithRecordedTime


class AqmConfigManager(object):
    def __init__(self):
        self._remote_config: Config = defaultConfig()
        self._local_config: Config = defaultConfig()
        self._pending_change: bool = False
        self._last_remote_update: datetime = datetime.min

    def __str__(self) -> str:
        return f'''
         ====================================================================
         Last Remote Config Received:{str(self._last_remote_update)}
         Change Pending: {self._pending_change}
         ====================================================================
         Visualization:
             R: {str(self._remote_config['visualization'])}
             L: {str(self._local_config['visualization'])}

         Fan Mode:
             R: {str(self._remote_config['fan_mode'])}
             L: {str(self._local_config['fan_mode'])}

         LCD Mode:
             R: {str(self._remote_config['lcd_bl_mode'])}
             L: {str(self._local_config['lcd_bl_mode'])}

         PM Mode:
             R: {str(self._remote_config['pm_dc_mode'])}
             L: {str(self._local_config['pm_dc_mode'])}

         BLE Data Mode:
             R: {str(self._remote_config['ble_data_mode'])}
             L: {str(self._local_config['ble_data_mode'])}

         Auto Scroll:
             R: {str(self._remote_config['auto_scroll'])}
             L: {str(self._local_config['auto_scroll'])}
        '''

    @property
    def remote_config(self) -> Config:
        return self._remote_config

    @property
    def remote_config_str(self) -> dict:
        ret = {}
        for key, setting in self._remote_config.items():
            ret[setting.__class__.__name__] = (  # type: ignore
                setting.value, str(setting))  # type: ignore
        return ret

    @remote_config.setter  # type: ignore
    @recordTime
    def remote_config(self, new_config_value: List[int]):
        self._remote_config = decodeConfigData(new_config_value)
        if not self._pending_change:
            self._local_config = self._remote_config
        logging.info('Received new Configuration value %s' %
                     ''.join('{:02x}'.format(x) for x in new_config_value))
        logging.info('Decoded config :\n%s', str(self))

    @property
    def encoded_remote_config(self) -> List[int]:
        return encodeConfigData(self._remote_config)

    @property
    def all_config_values(self) -> dict:
        return {enum_type.__name__: {
            'nice_name': enum_type.nice_name(),
            'values': {v: str(enum_type(v))
                       for v in range(0, len(enum_type)-1)}}
                for enum_type in ALL_ENUMS}
