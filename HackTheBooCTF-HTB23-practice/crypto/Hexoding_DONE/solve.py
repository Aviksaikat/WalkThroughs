#!/usr/bin/python3
from base64 import b64decode
from binascii import unhexlify

with open("output.txt", 'r') as f:
	data = f.readlines()

hex_part = data[0]
b64_part = data[1]

#print(b64decode(b64_part))

print(bytes.fromhex(hex_part).decode() + b64decode(b64_part).decode())