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

import webservice

from absl import app
from absl import flags
from absl import logging
from aqm_controller import AqmController
from aqm_config_manager import AqmConfigManager
from aqm_data_manager import AqmDataManager


def main(argv):
    config_manager = AqmConfigManager()
    data_manager = AqmDataManager()
    controller = AqmController(config_manager, data_manager)
    controller.connect()
    webservice.startServer(config_manager, data_manager)
    pass


if __name__ == '__main__':
    app.run(main)
