#!/usr/bin/python3

import re


def xor(bytes_arr, key):
    return bytes(b ^ key for b in bytes_arr)

with open ("output.txt", 'r') as f:
    l = ''.join(f.read().split())

#print(l)

# convert the contents of the files to hex bytes 

cipher_bytes = bytes.fromhex(l)

#! find the key by brute-forcing

"""
#Bytes 0 to 255(0x00 to 0xff)
for key in range(256):
	result = xor(cipher_bytes, key).decode("utf-8",errors='ignore')
	
	res = re.findall("CHTB{*",result)
	
	#! if we found the pattern then the list will not be empty 
	if(len(res) != 0):
		print("Key: ",key)
		print(res)
"""

#! for key 69 we found the pattern CHBT

result = xor(cipher_bytes, 69).decode("utf-8",errors='ignore')

# basic regex to to find the pattern

res = re.findall("CHTB{.*?}",result)
print(res[0])