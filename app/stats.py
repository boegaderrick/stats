#!/usr/bin/python3
"""This script starts the stats application"""
from flask import Flask, render_template, make_response, jsonify
from src import storage


app = Flask(__name__)

@app.route('/stats', strict_slashes=False)
def launch_app():
    """This function launches the app"""
    return render_template('stats.html')

@app.route('/api/stats/athletes', strict_slashes=False)
def get_athletes():
    """This function returns json representation of all athlete objects"""
    ret = []
    athletes = storage.get('Athlete')
    for athlete in athletes:
        curr = {}
        for key, val in athlete.__dict__.items():
            if key == 'sport':
                curr[key] = val.__dict__
            elif key == 'team':
                curr[key] = val.__dict__
            elif key == '_sa_instance_state':
                continue
            else:
                curr[key] = val
        ret.append(curr)

    return make_response(jsonify(ret))


@app.teardown_appcontext
def session_end(Exception=None):
    """This function closes the session object"""
    storage.close()

if __name__ == '__main__':
    app.run(host='0.0.0.0', port='5000', debug=True)
