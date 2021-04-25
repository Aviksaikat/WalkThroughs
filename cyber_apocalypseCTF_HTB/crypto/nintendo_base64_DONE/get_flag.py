#!/usr/bin/python3

import base64

# reading the contents of the file without spcaes & new-lines
with open ("output.txt", 'r') as f:
	l = ''.join(f.read().split())

#print(l)

#decode the base64 & convet it to str bcz default decoded type is byte
decoded = base64.b64decode(l).decode('utf-8')

#print(decoded)
#print("[*]Decoding")

#decode while not getting the flag
while(decoded[:4] != "CHTB"):
	decoded = base64.b64decode(decoded).decode('utf-8')

# for showing off my python skills
print("Flag: ",end="")
print(decoded)
