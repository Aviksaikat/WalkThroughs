#!/usr/bin/python3
import binascii

with open("data", 'r') as d:
	data = d.read().encode().split()

with open("file", 'wb') as w:
	for d in data:
		w.write(binascii.unhexlify(d))
#print(data)

