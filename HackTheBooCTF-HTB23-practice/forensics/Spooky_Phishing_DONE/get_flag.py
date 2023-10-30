#!/usr/bin/python3
from base64 import b64decode
from re import findall


def add_base64_padding(base64_string):
	# Calculate the number of padding characters needed
	padding_length = 4 - (len(base64_string) % 4)

	# Add the required "=" padding characters
	padded_base64 = base64_string + "=" * padding_length

	return padded_base64

with open("index.html") as f:
	data = f.read()

values = findall("value=.*\"", data)

#value1 = values[0]
base64String = ""

for value in values:
	base64String += value.split('=')[1].strip('"').strip()

base64String = add_base64_padding(base64String)

flag = findall(b"HTB{.*}", bytes.fromhex(b64decode(base64String).decode()))[-1].decode()

print(flag)