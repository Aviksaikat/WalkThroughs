#!/usr/bin/python3

import requests

url = "https://infinity.freedomctf.org/"


r = requests.get(url)

print(r.text)