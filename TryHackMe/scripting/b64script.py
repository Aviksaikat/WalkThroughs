#!/usr/bin/python3

from base64 import b64decode

with open("b64.txt", 'r') as f:
	data = f.read().strip()

#print(data)
def decode(str):
	return b64decode(str).decode()

for _ in range(50):
	data = decode(data)

print(data)