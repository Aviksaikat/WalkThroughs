#!/usr/bin/python3


import hashlib
import sys

salt = "5a599ef579066807"
password = "62def4866937f08cc13bab43bb14e6f7"
output = ""


def crack_password(salt, password):
	global output
	
	try:
		dict = open(sys.argv[1], errors="ignore")
	except IndexError :
		print(f"Invalid arguments\npython3{sys.argv[0]} <wordlist>")
		sys.exit(-1)

	for line in dict.readlines():
		line = line.replace("\n", "")
		#print(line)
		if hashlib.md5((salt + line).encode()).hexdigest() == password:
			output += "\n[+] Password cracked: " + line 
			print(output)
	dict.close()

if __name__ == "__main__":
	print("[*]Cracking password")
	crack_password(salt, password)