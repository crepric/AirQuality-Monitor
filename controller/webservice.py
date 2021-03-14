import os
from flask import Flask, render_template, jsonify, request, abort, Blueprint, current_app
from rules_python.python.runfiles import runfiles

import logging
log = logging.getLogger('werkzeug')
log.setLevel(logging.WARNING)

r = runfiles.Create()
runfiles_dir = r.EnvVars()['RUNFILES_DIR']
TEMPLATE_FOLDER = 'air_quality_monitor/web/templates/'
STATIC_FOLDER = 'air_quality_monitor/web/resources/'

flaskbp = Blueprint('aqm',
                    __name__,
                    template_folder=os.path.join(
                        runfiles_dir, TEMPLATE_FOLDER),
                    static_folder=os.path.join(runfiles_dir, STATIC_FOLDER),
                    static_url_path="")


def create_app(aqm_config_manager, aqm_data_manager):
    app = Flask(__name__)
    app.config['CM'] = aqm_config_manager
    app.config['DM'] = aqm_data_manager
    app.register_blueprint(flaskbp)
    return app


@flaskbp.route('/')
def serve():
    return render_template('index.html')


@flaskbp.route('/current_config', methods=['GET'])
def serve_current_config():
    return jsonify(current_app.config['CM'].remote_config_str)


@flaskbp.route('/current_data', methods=['GET'])
def serve_current_data():
    return jsonify(
        {
            'data': current_app.config['DM'].current_data,
            'age': str(current_app.config['DM'].last_update_age),
            'last_update': current_app.config['DM'].last_update,
        }
    )


@flaskbp.route('/get_config_options', methods=['GET'])
def serve_config_values():
    return jsonify(current_app.config['CM'].all_config_values)


def startServer(aqm_config_manager, aqm_data_manager):
    print(runfiles_dir)
    create_app(aqm_config_manager, aqm_data_manager).run(
        host="0.0.0.0", port=8000)
