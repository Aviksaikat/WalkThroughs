import os, bcrypt, jwt, datetime
from functools import wraps
from flask import jsonify,abort,session

generate = lambda x: os.urandom(x).hex()
#key = generate(50)
key = b'cX\x0e\xdd' #"Y1gO3Q"

def response(message):
    return jsonify({'message': message})

def generate_token(username):
    token_expiration = datetime.datetime.utcnow() + datetime.timedelta(minutes=360)
    
    encoded = jwt.encode(
        {
            'username': username,
            'exp': token_expiration
        },
        key,
        algorithm='HS256'
    )
    print(encoded)
    return encoded

def token_verify(token):
    try:
        token_decode = jwt.decode(
            token,
            key,
            algorithms='HS256'
        )
        print(token_decode)
        return token_decode
    except:
        return abort(400, 'Invalid token!')

def is_authenticated(f):
    @wraps(f)
    def decorator(*args, **kwargs):
        token = session.get('auth')

        if not token:
            return abort(401, 'Unauthorised access detected!')

        token_verify(token)

        return f(*args, **kwargs)

    return decorator

def generate_password_hash(password):
    salt = bcrypt.gensalt()
    return bcrypt.hashpw(password.encode(), salt).decode()

def verify_hash(password, passhash):
    return bcrypt.checkpw(password.encode(), passhash.encode())


generate_token("admin")