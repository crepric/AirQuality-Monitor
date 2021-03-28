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
import time

from absl import flags, logging
from datetime import date, datetime, timedelta
from functools import wraps
from redistimeseries.client import Client
from threading import Thread, Event
from typing import Callable, List, Optional, Type, TypedDict

FLAGS = flags.FLAGS

flags.DEFINE_string('redis_host', 'localhost', 'Host for the Redis server')
flags.DEFINE_integer('redis_port', 6379,
                     'Port on which the Redis host listens')
flags.DEFINE_integer('redis_db', 0, 'Redis db number')


class Data(TypedDict):
    temp: float
    hum: float
    bmp: float
    pm1: int
    pm25: int
    pm10: int


def recordTime(func: Callable):
    ''' Decorator used to timestamp the last time data was received.'''
    @wraps(func)
    def FuncWithRecordedTime(self, *args, **kwargs):
        self._last_update = datetime.now()
        func(self, *args, **kwargs)
    return FuncWithRecordedTime


class RedisManager(Thread):
    ''' This class runs a separate thread to periodically store data to the
        remote db. '''

    def __init__(self, event: Event, data_manager: Type['AqmDataManager']):
        Thread.__init__(self)
        self._client = Client(host=FLAGS.redis_host,
                              port=FLAGS.redis_port, db=FLAGS.redis_db)
        self._stopped = event
        self._data_manager = data_manager
        self._metrics = {
            'temperature': {
                'get': AqmDataManager.temp,
            },
            'humidity': {
                'get': AqmDataManager.hum,
            },
            'bmp': {
                'get': AqmDataManager.bmp,
            },
            'pm1': {
                'get': AqmDataManager.pm1,
            },
            'pm25': {
                'get': AqmDataManager.pm25,
            },
            'pm10': {
                'get': AqmDataManager.pm10,
            },
        }
        self._retention_rules = [
            {
                'duration': '1min',
                'retention_msecs': 24*60*60*1000,  # 1 day
                'aggregation': 'avg',
                'bucket_size': 60*1000,
            },
            {
                'duration': '10min',
                'retention_msecs': 6*24*60*60*1000,  # 6 days
                'aggregation': 'avg',
                'bucket_size': 10*60*1000,
            },
            {
                'duration': '1hr',
                'retention_msecs': 60*24*60*60*1000,  # 60 days
                'aggregation': 'avg',
                'bucket_size': 60*60*1000,
            },
            {
                'duration': '1dayMin',
                'retention_msecs': 5*365*24*60*60*1000,  # 5 years
                'aggregation': 'min',
                'bucket_size': 24*60*60*1000,
            },
            {
                'duration': '1dayMax',
                'retention_msecs': 5*365*24*60*60*1000,  # 5 years
                'aggregation': 'max',
                'bucket_size': 24*60*60*1000,
            }
        ]

    def _setup_db(self):
        for metric in self._metrics.keys():
            try:
                rawkey = '%s:1' % metric
                self._client.create(rawkey, retention_msecs=120*1000)
            except:
                logging.info('Failed creating raw metric for %s in db, '
                             'probably DB is already configured.' %
                             metric)
            for bucket in self._retention_rules:
                key = '%s:%s' % (rawkey, bucket['duration'])
                try:
                    logging.info('Creating key %s', key)
                    self._client.create(
                        key,
                        retention_msecs=bucket['retention_msecs'])
                except:
                    logging.info('Failed creating metric in db, '
                                 ' for metric %s and bucket %s'
                                 ' probably DB is already configured.' %
                                 (metric, bucket['duration']))
                try:
                    self._client.createrule(rawkey,
                                            key, bucket['aggregation'],
                                            bucket['bucket_size'])

                except:
                    logging.info('Failed creating rules in db, '
                                 ' for metric %s and bucket %s'
                                 ' probably DB is already configured.' %
                                 (metric, bucket['duration']))

    def run(self):
        logging.info("Setting Up Database")
        self._setup_db()
        logging.info("Recording started.")
        while not self._stopped.is_set():
            logging.info('Recording...')
            for metric in self._metrics.keys():
                try:
                    rawkey = '%s:1' % metric
                    data = self._metrics[metric]['get'].fget(
                        self._data_manager)
                    if data != -100:
                        logging.info('%s, %s', data, rawkey)
                        self._client.add(
                            rawkey, '*', data)

                except:
                    logging.exception('Failure while recording %s', metric)
            self._stopped.wait(10)
        logging.info("Thread is done.")

    @property
    def metrics_keys(self) -> List[str]:
        return ['%s:1' % m for m in self._metrics.keys()]

    def get_history(self, metric: str, granularity: str,
                    time_from: Optional[int], time_to: Optional[int]):
        metric_key = '%s:%s' % (metric, granularity)
        values = []  # type: ignore
        try:
            values = self._client.range(
                metric_key,
                time_from if time_from else '-',
                time_to if time_to else '+')
        except:
            logging.exception('Failed to retrieve data')
        return values

    # TODO: cleanup this code, remove redundancy.
    @property
    def temp_last_hour(self):
        return self.get_history(
            metric='temperature:1', granularity='1min',
            time_from=int(time.time())*1000 - 60*60*1000, time_to=None)

    @property
    def temp_last_day(self):
        return self.get_history(
            metric='temperature:1', granularity='10min',
            time_from=int(time.time())*1000 - 24*60*60*1000, time_to=None)

    @property
    def temp_last_month(self):
        return self.get_history(
            metric='temperature:1', granularity='1hr',
            time_from=int(time.time())*1000 - 30*24*60*60*1000, time_to=None)

    @property
    def hum_last_hour(self):
        return self.get_history(
            metric='humidity:1', granularity='1min',
            time_from=int(time.time())*1000 - 60*60*1000, time_to=None)

    @property
    def hum_last_day(self):
        return self.get_history(
            metric='humidity:1', granularity='10min',
            time_from=int(time.time())*1000 - 24*60*60*1000, time_to=None)

    @property
    def hum_last_month(self):
        return self.get_history(
            metric='humidity:1', granularity='1hr',
            time_from=int(time.time())*1000 - 30*24*60*60*1000, time_to=None)

    @property
    def bmp_last_hour(self):
        return self.get_history(
            metric='bmp:1', granularity='1min',
            time_from=int(time.time())*1000 - 60*60*1000, time_to=None)

    @property
    def bmp_last_day(self):
        return self.get_history(
            metric='bmp:1', granularity='10min',
            time_from=int(time.time())*1000 - 24*60*60*1000, time_to=None)

    @property
    def bmp_last_month(self):
        return self.get_history(
            metric='bmp:1', granularity='1hr',
            time_from=int(time.time())*1000 - 30*24*60*60*1000, time_to=None)

    @property
    def pm1_last_hour(self):
        return self.get_history(
            metric='pm1:1', granularity='1min',
            time_from=int(time.time())*1000 - 60*60*1000, time_to=None)

    @property
    def pm1_last_day(self):
        return self.get_history(
            metric='pm1:1', granularity='10min',
            time_from=int(time.time())*1000 - 24*60*60*1000, time_to=None)

    @property
    def pm1_last_month(self):
        return self.get_history(
            metric='pm1:1', granularity='1hr',
            time_from=int(time.time())*1000 - 30*24*60*60*1000, time_to=None)

    @property
    def pm25_last_hour(self):
        return self.get_history(
            metric='pm25:1', granularity='1min',
            time_from=int(time.time())*1000 - 60*60*1000, time_to=None)

    @property
    def pm25_last_day(self):
        return self.get_history(
            metric='pm25:1', granularity='10min',
            time_from=int(time.time())*1000 - 24*60*60*1000, time_to=None)

    @property
    def pm25_last_month(self):
        return self.get_history(
            metric='pm25:1', granularity='1hr',
            time_from=int(time.time())*1000 - 30*24*60*60*1000, time_to=None)

    @property
    def pm10_last_hour(self):
        return self.get_history(
            metric='pm10:1', granularity='1min',
            time_from=int(time.time())*1000 - 60*60*1000, time_to=None)

    @property
    def pm10_last_day(self):
        return self.get_history(
            metric='pm10:1', granularity='10min',
            time_from=int(time.time())*1000 - 24*60*60*1000, time_to=None)

    @property
    def pm10_last_month(self):
        return self.get_history(
            metric='pm10:1', granularity='1hr',
            time_from=int(time.time())*1000 - 30*24*60*60*1000, time_to=None)


class AqmDataManager(object):
    ''' Stores the last data + timestamp recorded from the device.
    '''

    def __init__(self):
        self._current_data: Data = {
            'temp': -100,
            'hum': -100,
            'bmp': -100,
            'pm1': -100,
            'pm25': -100,
            'pm10': -100,
        }

    def __enter__(self):
        self._last_update: datetime = date.min
        self._stop_recording = Event()
        self._redis_manager = RedisManager(self._stop_recording, self)
        self._redis_manager.start()
        return self

    def __exit__(self, exc_type, exc_value, traceback):
        self._stop_recording.set()

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

    @property
    def redis_manager(self):
        return self._redis_manager
