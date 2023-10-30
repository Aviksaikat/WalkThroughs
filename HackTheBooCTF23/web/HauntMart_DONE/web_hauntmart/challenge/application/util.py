import datetime
import os
from functools import wraps

import jwt
import requests
from flask import abort, jsonify, request, session

generate = lambda x: os.urandom(x).hex()
key = generate(50)

blocked_host = ["127.0.0.1", "localhost", "0.0.0.0"]


def response(message):
    return jsonify({"message": message})


def isSafeUrl(url):
    for hosts in blocked_host:
        if hosts in url:
            return False

    return True


def generateToken(username, role):
    token_expiration = datetime.datetime.utcnow() + datetime.timedelta(minutes=360)

    encoded = jwt.encode(
        {"username": username, "role": role, "exp": token_expiration},
        key,
        algorithm="HS256",
    )

    return encoded


def tokenVerify(token):
    try:
        token_decode = jwt.decode(token, key, algorithms="HS256")

        return token_decode
    except:
        return abort(400, "Invalid token!")


def downloadManual(url):
    safeUrl = isSafeUrl(url)
    if safeUrl:
        try:
            print("PASSED CHECK")
            local_filename = url.split("/")[-1]
            r = requests.get(url)

            with open(f"/opt/manualFiles/{local_filename}", "wb") as f:
                for chunk in r.iter_content(chunk_size=1024):
                    if chunk:
                        f.write(chunk)
            return True
        except:
            return False

    return False


def isFromLocalhost(func):
    @wraps(func)
    def check_ip(*args, **kwargs):
        if request.remote_addr != "127.0.0.1":
            return abort(403)
        return func(*args, **kwargs)

    return check_ip


def isAuthenticated(f):
    @wraps(f)
    def decorator(*args, **kwargs):
        token = session.get("token")

        if not token:
            return abort(401, "Unauthorised access detected!")

        user = tokenVerify(token)

        kwargs["user"] = user

        return f(*args, **kwargs)

    return decorator
