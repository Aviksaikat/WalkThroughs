#!/usr/bin/env python3
#! thm flask room file
from flask import Flask, request

app = Flask(__name__)

@app.route('/')
# def Hellow():
#     return "Yo"
def home():
    return "Home Page"

@app.route("/admin")
def admin():
    return "Admin Page"

def do_the_login():
    return "This was a POST req."

def show_the_login():
    return "Not POST. Are you GETting this"

@app.route("/login",methods=["GET","POST"])
def login():
    if(request.method == "POST"):
        return do_the_login()
    else:
        return show_the_login()

