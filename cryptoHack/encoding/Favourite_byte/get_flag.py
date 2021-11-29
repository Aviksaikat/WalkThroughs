#!/usr/bin/env/python3

from pwn import xor

#returns a byte array
text = bytes.fromhex("73626960647f6b206821204f21254f7d694f7624662065622127234f726927756d")

comb = []

for i in range(256):
	#both args are of type byte
	comb = xor(text,chr(i))
	#print(comb)
	if comb.startswith(b"crypto"):
		#print(f"i={i}")
		flag = str(comb).strip('b').strip("'")
		break

print(flag)
