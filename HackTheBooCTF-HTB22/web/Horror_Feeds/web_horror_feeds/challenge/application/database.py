from colorama import Cursor
from application.util import generate_password_hash, verify_hash, generate_token
from flask_mysqldb import MySQL

mysql = MySQL()

def query_db(query, args=(), one=False):
    cursor = mysql.connection.cursor()
    cursor.execute(query, args)
    rv = [dict((cursor.description[idx][0], value)
        for idx, value in enumerate(row)) for row in cursor.fetchall()]
    return (rv[0] if rv else None) if one else rv


def login(username, password):
    user = query_db('SELECT password FROM users WHERE username = %s', (username,), one=True)

    if user:
        password_check = verify_hash(password, user.get('password'))

        if password_check:
            token = generate_token(username)
            return token
        else:
            return False
    else:
        return False

def register(username, password):
    exists = query_db('SELECT * FROM users WHERE username = %s', (username,))
   
    if exists:
        return False
    
    hashed = generate_password_hash(password)

    query_db(f'INSERT INTO users (username, password) VALUES ("{username}", "{hashed}")')
    mysql.connection.commit()

    return True