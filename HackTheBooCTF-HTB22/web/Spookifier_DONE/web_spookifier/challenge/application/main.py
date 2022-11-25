from flask import Flask, jsonify
from application.blueprints.routes import web
from flask_mako import MakoTemplates

app = Flask(__name__)
MakoTemplates(app)

def response(message):
    return jsonify({'message': message})

app.register_blueprint(web, url_prefix='/')

@app.errorhandler(404)
def not_found(error):
    return response('404 Not Found'), 404

@app.errorhandler(403)
def forbidden(error):
    return response('403 Forbidden'), 403

@app.errorhandler(400)
def bad_request(error):
    return response('400 Bad Request'), 400
