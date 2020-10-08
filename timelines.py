import flask
from flask import request, jsonify, g
import sqlite3
from datetime import datetime

app = flask.Flask(__name__)
app.config.from_envvar('APP_CONFIG')


def make_dicts(cursor, row):
    return dict((cursor.description[idx][0], value)
                for idx, value in enumerate(row))


def get_db():
    db = getattr(g, '_database', None)
    if db is None:
        db = g._database = sqlite3.connect(app.config['DATABASE'])
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


@app.route('/', methods=['GET'])
def home():
    return '''<h1>Distant Reading Archive</h1>
<p>A prototype API for distant reading of science fiction novels.</p>'''


@app.route('/users/all', methods=['GET'])
def users_all():
    all_users = query_db('SELECT * FROM users;')
    return jsonify(all_users)


@app.route('/posts',methods=['POST'])
def postTweet():
    query_params = request.get_json()
    text = query_params['text']
    now = datetime.now()
    timestamp = now.strftime('%Y-%m-%d %H:%M:%S')
    author = query_params['username']

    db = get_db()
    
    query_db('INSERT INTO posts(text,timestamp,author) VALUES (?,?,?);',(text,timestamp,author))
    db.commit()
    return "created",201
    
@app.route('/timeline',methods=['GET'])
def getPublicTimeline():
    all_tweets = query_db('SELECT text, author, timestamp FROM posts ORDER BY timestamp DESC LIMIT 25;')
    return jsonify(all_tweets)

@app.route('/timeline/<username>', methods = ['GET'])
def getUserTimeline(username):
    user_tweets = query_db('SELECT text, author, timestamp FROM posts WHERE author = ? ORDER BY timestamp DESC LIMIT 25;', (username,))
    return jsonify(user_tweets)

@app.route('/homeTimeline/<username>', methods = ['GET'])
def getHomeTimeline(username):
    home_tweets = query_db('SELECT text, author, timestamp FROM posts WHERE author IN (SELECT follower FROM followerlist WHERE username = ?) ORDER BY timestamp DESC LIMIT 25;', (username,))
    return jsonify(home_tweets)

@app.errorhandler(404)
def page_not_found(e):
    return "<h1>404</h1><p>The resource could not be found.</p>", 404


