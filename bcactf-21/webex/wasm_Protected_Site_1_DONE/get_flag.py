#!/usr/bin/python3

import requests
import re

url = "http://web.bcactf.com:49157/"

r = requests.get(url + "code.wasm")

#print(response)
print(re.findall("bcactf{.*}", r.text)[0])