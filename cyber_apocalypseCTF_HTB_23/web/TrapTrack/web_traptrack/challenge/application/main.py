from flask import Flask
from application.blueprints.routes import web, api, response
from application.database import db, User
from flask_login import LoginManager
from flask_session import Session
import redis

app = Flask(__name__)
app.config.from_object('application.config.Config')

app.redis = redis.StrictRedis(host=app.config['REDIS_HOST'], port=app.config['REDIS_PORT'], db=0)
app.redis.flushdb()
app.redis.getset(app.config['REDIS_NUM_JOBS'], 100)

db.init_app(app)

login_manager = LoginManager()
login_manager.init_app(app)

sess = Session()
sess.init_app(app)

app.register_blueprint(web, url_prefix='/')
app.register_blueprint(api, url_prefix='/api')

@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))

@app.errorhandler(404)
def not_found(error):
    return response('404 Not Found', 404)

@app.errorhandler(403)
def forbidden(error):
    return response('403 Forbidden', 403)

@app.errorhandler(400)
def bad_request(error):
    return response('400 Bad Request', 400)

