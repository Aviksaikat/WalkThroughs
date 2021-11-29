#!/usr/bin/python3

from binascii import unhexlify

with open("output.txt", 'r') as f:
	data = f.read().strip()

print(unhexlify(data))