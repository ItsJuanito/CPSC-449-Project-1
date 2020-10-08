import flask
from flask import request, jsonify, g
import sqlite3
from werkzeug.security import generate_password_hash,check_password_hash
import requests

app = flask.Flask(__name__)



def make_dicts(cursor, row):
    return dict((cursor.description[idx][0], value)
                for idx, value in enumerate(row))


def get_db():
    db = getattr(g, '_database', None)
    if db is None:
        db = g._database = sqlite3.connect('users.db')
        db.row_factory = make_dicts
    return db


@app.teardown_appcontext
def close_connection(exception):
    db = getattr(g, '_database', None)
    if db is not None:
        db.close()


def query_db(query, args=(), one=False):
    cur = get_db().execute(query, args)
    rv = cur.fetchall()
    cur.close()
    return (rv[0] if rv else None) if one else rv


@app.cli.command('init')
def init_db():
    with app.app_context():
        db = get_db()
        with app.open_resource('schema.sql', mode='r') as f:
            db.cursor().executescript(f.read())
        db.commit()



@app.route('/users/all', methods=['GET'])
def users_all():
    all_users = query_db('SELECT * FROM users;')
    return jsonify(all_users)

@app.route('/users', methods=['POST'])
def createUser():
    try:
        query_params = request.get_json()
        username = query_params['username']
        password = query_params['password']
        password = generate_password_hash(password)
        email = query_params['email']
        db = get_db()
        query_db('INSERT INTO users(username,password,email) VALUES (?,?,?);',(username,password,email))
        db.commit()
        response = jsonify({"status": "created" })
        response.status_code = 201
        response.headers["Content-Type"] = "application/json; charset=utf-8"
        return response
    except Exception:
        response = jsonify({"status": "Bad request" })
        response.status_code = 400
        response.headers["Content-Type"] = "application/json; charset=utf-8"
        return response
   

@app.route('/users/<username>', methods=['PUT'])
def addFollower(username):
    try:
        query_params = request.get_json()
        original = query_params['username']
        db = get_db()
        query_db('INSERT INTO followerlist(username,follower) VALUES (?,?);',(original,username))
        db.commit()
        response = jsonify({"status": "ok" })
        response.status_code = 200
        response.headers["Content-Type"] = "application/json; charset=utf-8"
        return response
    except Exception:
        response = jsonify({"status": "Bad request" })
        response.status_code = 400
        response.headers["Content-Type"] = "application/json; charset=utf-8"
        return response

@app.route('/users/<username>', methods=['DELETE'])
def removeFollower(username):
    try:
        query_params = request.get_json()
        original = query_params['username']
        db = get_db()
        query_db('DELETE FROM followerlist WHERE username = ? AND follower = ?',(original,username))
        db.commit()
        response = jsonify({"status": "ok" })
        response.status_code = 200
        response.headers["Content-Type"] = "application/json; charset=utf-8"
        return response
    except Exception:
        response = jsonify({"status": "Bad request" })
        response.status_code = 400
        response.headers["Content-Type"] = "application/json; charset=utf-8"
        return response

@app.route('/users/<username>/<password>', methods=['GET'])
def authenticateUser(username,password):
    try:
        auth = query_db('SELECT * FROM users WHERE username = ?;',(username,))
        stored = auth[0]['password']
        result = check_password_hash(stored,password)
        if result == True:
            response = jsonify({"status": "Authorized" })
            response.status_code = 200
            response.headers["Content-Type"] = "application/json; charset=utf-8"
            return response

        else:
            message = {'message': "Authenticate."}
            resp = jsonify(message)
            resp.status_code = 401
            resp.headers["Content-Type"] = "application/json; charset=utf-8"
            return resp
    except Exception:
        response = jsonify({"status": "Bad request" })
        response.status_code = 400
        response.headers["Content-Type"] = "application/json; charset=utf-8"
        return response

@app.errorhandler(404)
def page_not_found(e):
    return "<h1>404</h1><p>The resource could not be found.</p>", 404


