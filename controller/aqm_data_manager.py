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


class AqmDataManager(object):
    def __init__(self):
        self._current_data = {
            'temp': -1,
            'hum': -1,
            'bmp': -1,
            'pm1': -1,
            'pm25': -1,
            'pm10': -1,
        }

    def setTemp(self, temperature):
        self._current_data['temp'] = temperature

    def setHum(self, humidity):
        self._current_data['hum'] = humidity

    def setBmp(self, bmp):
        self._current_data['bmp'] = bmp

    def setPM1(self, pm1):
        self._current_data['pm1'] = pm1

    def setPM25(self, pm25):
        self._current_data['pm25'] = pm25

    def setPM10(self, pm10):
        self._current_data['pm10'] = pm10

    def getCurrentData(self):
        return self._current_data
