import MySQLdb.cursors
from flask_mysqldb import MySQL

mysql = MySQL()


def query(query, args=(), one=False):
    cursor = mysql.connection.cursor()
    cursor.execute(query, args)
    rv = [
        dict((cursor.description[idx][0], value) for idx, value in enumerate(row))
        for row in cursor.fetchall()
    ]
    return (rv[0] if rv else None) if one else rv


def loginUserDb(username, password):
    user = query(
        "SELECT username, role FROM users WHERE username = %s AND password = %s",
        (
            username,
            password,
        ),
        one=True,
    )

    if user:
        return user
    else:
        return False


def registerUserDb(username, password, role):
    check_user = query(
        "SELECT username FROM users WHERE username = %s", (username,), one=True
    )

    if not check_user:
        query(
            "INSERT INTO users(username, password, role) VALUES(%s, %s, %s)",
            (
                username,
                password,
                role,
            ),
        )
        mysql.connection.commit()

        return True

    return False


def makeUserAdmin(username):
    check_user = query(
        "SELECT username FROM users WHERE username = %s", (username,), one=True
    )

    if check_user:
        query('UPDATE users SET role="admin" WHERE username=%s', (username,))
        mysql.connection.commit()
        return True

    return False


def addProduct(name, description, price):
    query(
        "INSERT INTO products(name, description, price) VALUES(%s, %s, %s)",
        (
            name,
            description,
            price,
        ),
    )
    mysql.connection.commit()
    return True
