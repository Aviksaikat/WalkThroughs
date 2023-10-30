import sys

from application.database import *
from application.util import (downloadManual, generateToken, isAuthenticated,
                              isFromLocalhost, response)
from flask import (Blueprint, current_app, redirect, render_template, request,
                   session)

web = Blueprint("web", __name__)
api = Blueprint("api", __name__)


@web.route("/", methods=["GET"])
def loginView():
    return render_template("login.html")


@web.route("/register", methods=["GET"])
def registerView():
    return render_template("register.html")


@web.route("/home", methods=["GET"])
@isAuthenticated
def homeView(user):
    return render_template("index.html", user=user, flag=current_app.config["FLAG"])


@web.route("/product", methods=["GET"])
@isAuthenticated
def productView(user):
    return render_template("product.html", user=user)


@web.route("/logout")
def logout():
    session["token"] = None
    return redirect("/")


@api.route("/login", methods=["POST"])
def api_login():
    if not request.is_json:
        return response("Invalid JSON!"), 400

    data = request.get_json()
    username = data.get("username", "")
    password = data.get("password", "")

    if not username or not password:
        return response("All fields are required!"), 401

    user = loginUserDb(username, password)

    if user:
        token = generateToken(user.get("username"), user.get("role"))
        session["token"] = token
        return response("Success"), 200

    return response("Invalid credentials!"), 403


@api.route("/register", methods=["POST"])
def api_register():
    if not request.is_json:
        return response("Invalid JSON!"), 400

    data = request.get_json()
    username = data.get("username", "")
    password = data.get("password", "")

    if not username or not password:
        return response("All fields are required!"), 401

    user = registerUserDb(username, password, "user")

    if user:
        return response("User registered! Please login"), 200

    return response("User already exists!"), 403


@api.route("/product", methods=["POST"])
@isAuthenticated
def sellProduct(user):
    if not request.is_json:
        return response("Invalid JSON!"), 400

    data = request.get_json()
    name = data.get("name", "")
    price = data.get("price", "")
    description = data.get("description", "")
    manualUrl = data.get("manual", "")

    if not name or not price or not description or not manualUrl:
        return response("All fields are required!"), 401

    manualPath = downloadManual(manualUrl)
    if manualPath:
        addProduct(name, description, price)
        return response("Product submitted! Our mods will review your request")
    return response("Invalid Manual URL!"), 400


@api.route("/addAdmin", methods=["GET"])
@isFromLocalhost
def addAdmin():
    username = request.args.get("username")

    if not username:
        return response("Invalid username"), 400

    result = makeUserAdmin(username)

    if result:
        return response("User updated!")
    return response("Invalid username"), 400
