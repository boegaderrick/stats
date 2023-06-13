#!/usr/bin/python3
"""This script starts the stats application and serves related data"""
from flask import Flask, render_template, make_response, jsonify
from src import storage


app = Flask(__name__)

@app.route('/stats', strict_slashes=False)
def launch_app():
    """This function launches the app"""
    return render_template('stats.html')

@app.route('/stats/api/athletes', strict_slashes=False)
def get_athletes():
    """This function returns json representation of athlete objects"""
    ret = [i.get_dict() for i in storage.get('F1Driver')]
    return make_response(jsonify(ret))

@app.route('/stats/athletes/<type>/<id>', strict_slashes=False)
def get_athlete(type, id):
    """This function returns a specific athlete of a specific category"""
    athlete = storage.get(type, id).get_dict()
    return render_template('object.html', athlete=athlete)

@app.route('/stats/api/teams', strict_slashes=False)
def get_teams():
    """This function returns all team objects"""
    teams = [i.get_dict() for i in storage.get('Team')]
    return make_response(jsonify(teams))

@app.route('/stats/api/sports', strict_slashes=False)
def get_sports():
    """This function returns all sport objects"""
    sports = [i.get_dict() for i in storage.get('Sport')]
    return make_response(jsonify(sports))

@app.teardown_appcontext
def session_end(Exception=None):
    """This function closes the session object"""
    storage.close()

if __name__ == '__main__':
    app.run(host='0.0.0.0', port='5000', debug=True)
