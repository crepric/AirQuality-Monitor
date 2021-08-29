import os
from flask import Flask, render_template, jsonify, request, abort, Blueprint, current_app
from rules_python.python.runfiles import runfiles
from aqm_data_manager import RedisManager

import logging
log = logging.getLogger('werkzeug')
log.setLevel(logging.WARNING)

# If running in bazel.
r = runfiles.Create()

# If running as standalone binary, set AQM_FOLDER to the folder containing the
# web/ resources.
runfiles_dir = str(os.getenv('AQM_FOLDER'))
if r is not None:
    # If running in bazel, grab templates and files from this folder
    runfiles_dir = os.path.join(
        r.EnvVars()['RUNFILES_DIR'], 'air_quality_monitor')

TEMPLATE_FOLDER = os.path.join(runfiles_dir, 'web/templates/')
STATIC_FOLDER = os.path.join(runfiles_dir, 'web/resources/')

flaskbp = Blueprint('aqm',
                    __name__,
                    template_folder=TEMPLATE_FOLDER,
                    static_folder=STATIC_FOLDER,
                    static_url_path="")


def create_app(aqm_config_manager, aqm_data_manager):
    app = Flask(__name__)
    app.config['CM'] = aqm_config_manager
    app.config['DM'] = aqm_data_manager
    app.config['RM'] = aqm_data_manager.redis_manager
    app.register_blueprint(flaskbp)
    return app


@ flaskbp.errorhandler(400)
def resource_not_found(e):
    return jsonify(error=str(e)), 400


@ flaskbp.route('/')
def serve():
    return render_template('index.html')


@ flaskbp.route('/current_config', methods=['GET'])
def serve_current_config():
    return jsonify(current_app.config['CM'].remote_config_str)


@ flaskbp.route('/current_data', methods=['GET'])
def serve_current_data():
    return jsonify(
        {
            'data': current_app.config['DM'].current_data,
            'age': str(current_app.config['DM'].last_update_age),
            'last_update': current_app.config['DM'].last_update,
        }
    )


@ flaskbp.route('/history', methods=['GET'])
def history():
    metrics = request.args.get('metric', default=None)
    duration = request.args.get('duration', default=None)
    if not metrics or not duration:
        logging.warning('Incomplete data request, ignoring')
        abort(400, 'Data request incomplete, specify metric and duration')
    metrics = metrics.split(':')
    data = []
    for metric in metrics:
        method_string = '%s_last_%s' % (metric, duration)
        method = getattr(RedisManager, method_string, None)
        if not method:
            logging.warning('method %s not recognized', method)
            abort(400, 'Method not recognized')
        data.append(method.fget(current_app.config['RM']))
    final_data = zip(
        [x[0] for x in data[0][:]],
        *[[x[1] for x in data[i][:]] for i in range(len(data))])
    return jsonify(
        {
            'data': list(final_data)
        }
    )


@ flaskbp.route('/get_config_options', methods=['GET'])
def serve_config_values():
    return jsonify(current_app.config['CM'].all_config_values)


def startServer(aqm_config_manager, aqm_data_manager):
    print(runfiles_dir)
    create_app(aqm_config_manager, aqm_data_manager).run(
        host="0.0.0.0", port=8000)
