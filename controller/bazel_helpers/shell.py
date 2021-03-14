from IPython import start_ipython
from traitlets.config import Config

if __name__ == '__main__':
    c = Config()
    c.InteractiveShellApp.extensions = ['autoreload']
    c.InteractiveShellApp.exec_lines = [
        '%autoreload 2',
        'from aqm_data_manager import AqmDataManager as Dm',
        'from aqm_config_manager import AqmConfigManager as Cm',
        'from aqm_controller import AqmController as Controller',
        'import logging',
        'logger = logging.getLogger()',
        'logger.setLevel(logging.INFO)',
        'dm = Dm()',
        'cm = Cm()',
        'controller = Controller(cm, dm)'
    ]
    start_ipython(config=c)
