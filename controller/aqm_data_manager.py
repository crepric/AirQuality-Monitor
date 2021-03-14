'''
This is a free software: you can redistribute it and / or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Air Quality Monitor is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with This software.  If not, see < https: // www.gnu.org/licenses/>.
'''

from absl import logging
from datetime import date, datetime, timedelta
from functools import wraps
from typing import TypedDict, Callable


class Data(TypedDict):
    temp: float
    hum: float
    bmp: float
    pm1: int
    pm25: int
    pm10: int


def recordTime(func: Callable):
    @wraps(func)
    def FuncWithRecordedTime(self, *args, **kwargs):
        self._last_update = datetime.now()
        func(self, *args, **kwargs)
    return FuncWithRecordedTime


class AqmDataManager(object):
    ''' Stores the last data + timestamp recorded from the device.
    '''

    def __init__(self):
        self._current_data: Data = {
            'temp': -1,
            'hum': -1,
            'bmp': -1,
            'pm1': -1,
            'pm25': -1,
            'pm10': -1,
        }

        self._last_update: datetime = date.min

    def __str__(self) -> str:
        return f'''
         ===============================================
         Last received {str(self._last_update)}
         ===============================================
         temp:      {self.temp} C
         humidity:  {self.hum}%
         pressure:  {self.bmp} mbar
         pm 1.0:    {self.pm1} ug/m3
         pm 2.5:    {self.pm25} ug/m3
         pm 10 :    {self.pm10} ug/m3
         '''

    @property
    def last_update_age(self) -> int:
        return int(datetime.now().timestamp() - self._last_update.timestamp())

    @property
    def last_update(self) -> datetime:
        return self._last_update

    @property
    def current_data(self) -> Data:
        return self._current_data

    # Temperature
    @property
    def temp(self) -> float:
        return self._current_data['temp']

    @temp.setter  # type: ignore
    @recordTime
    def temp(self, temperature: float):
        self._current_data['temp'] = temperature

    # Humidity
    @property
    def hum(self) -> float:
        return self._current_data['hum']

    @hum.setter  # type: ignore
    @recordTime
    def hum(self, humidity: float):
        self._current_data['hum'] = humidity

    # Barometric pressure
    @property
    def bmp(self) -> float:
        return self._current_data['bmp']

    @bmp.setter  # type: ignore
    @recordTime
    def bmp(self, bmp: float):
        self._current_data['bmp'] = bmp/100

    # PM 1
    @property
    def pm1(self) -> int:
        return self._current_data['pm1']

    @pm1.setter  # type: ignore
    @recordTime
    def pm1(self, pm1: int):
        self._current_data['pm1'] = pm1

    # PM 2.5
    @property
    def pm25(self) -> int:
        return self._current_data['pm25']

    @pm25.setter  # type: ignore
    @recordTime
    def pm25(self, pm25: int):
        self._current_data['pm25'] = pm25

    # PM 10
    @property
    def pm10(self) -> int:
        return self._current_data['pm10']

    @pm10.setter  # type: ignore
    @recordTime
    def pm10(self, pm10: int):
        self._current_data['pm10'] = pm10
