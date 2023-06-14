#!/usr/bin/python3
"""This script starts the stats application and serves related data"""
from flask import Flask, render_template, make_response, jsonify
from src import storage


app = Flask(__name__)

@app.route('/stats', strict_slashes=False)
def launch_app():
    """This function returns the landing page"""
    return render_template('landing.html')

@app.route('/stats/home', strict_slashes=False)
def home():
    """This function returns the home page"""
    return render_template('home.html')

@app.route('/stats/api/athletes', strict_slashes=False)
def get_athletes():
    """This function returns json representation of athlete objects"""
    ret = []
    types =['F1Driver']
    for typ in types:
        ret.extend([i.get_dict() for i in storage.get(typ)])
    return make_response(jsonify(ret))

@app.route('/stats/athletes/<type>/<id>', strict_slashes=False)
def get_athlete(type, id):
    """
        This function returns a page containing a specific athlete
        of a specific category.
    """
    athlete = storage.get(type, id).get_dict()
    return render_template('object.html', athlete=athlete)

@app.route('/stats/api/teams', strict_slashes=False)
def get_teams():
    """This function returns all team objects in json format"""
    teams = [i.get_dict() for i in storage.get('Team')]
    return make_response(jsonify(teams))

@app.route('/stats/api/sports', strict_slashes=False)
def get_sports():
    """This function returns all sport objects in json format"""
    sports = [i.get_dict() for i in storage.get('Sport')]
    return make_response(jsonify(sports))

@app.teardown_appcontext
def session_end(Exception=None):
    """This function closes the session object"""
    storage.close()

if __name__ == '__main__':
    app.run(host='0.0.0.0', port='5005', debug=True)
