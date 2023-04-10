import os, jwt, datetime
from flask import jsonify,abort,session
from functools import wraps

generate = lambda x: os.urandom(x).hex()
key = generate(50)

def response(message):
    return jsonify({'message': message})

def createJWT(username):
    token_expiration = datetime.datetime.utcnow() + datetime.timedelta(minutes=360)
    
    encoded = jwt.encode(
        {
            'username': username,
            'exp': token_expiration
        },
        key,
        algorithm='HS256'
    )

    return encoded

def verifyJWT(token):
    try:
        token_decode = jwt.decode(
            token,
            key,
            algorithms='HS256'
        )

        return token_decode
    except:
        return abort(400, 'Invalid token!')

def isAuthenticated(f):
    @wraps(f)
    def decorator(*args, **kwargs):
        token = session.get('auth')

        if not token:
            return abort(401, 'Unauthorised access detected!')

        verifyJWT(token)

        return f(*args, **kwargs)

    return decorator