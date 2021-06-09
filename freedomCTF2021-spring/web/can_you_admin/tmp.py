#!/usr/bin/python3

import requests	

url = "https://canyou.freedomctf.org/login"

r = requests.get(url, data={"username": "admin", "password": "password"})

print(r.text)