from flask import jsonify
import os

generate = lambda x: os.urandom(x).hex()

def response(message):
    return jsonify({ 'message': message})