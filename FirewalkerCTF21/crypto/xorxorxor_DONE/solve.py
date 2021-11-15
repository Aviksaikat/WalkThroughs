#!/usr/bin/python3

flag = "134af6e1297bc4a96f6a87fe046684e8047084ee046d84c5282dd7ef292dc9"

def find_key(enc_byte,dec_byte):
	for x in range(256):
		if(int(enc_byte,16) ^ x == ord(dec_byte)):
			return x

key = []
key.append(find_key('13','H'))
key.append(find_key('4a','T'))
key.append(find_key('f6','B'))
key.append(find_key('e1','{'))

arr = []
for n in range(len(flag)):
	if(n % 2 == 0):
		#converting from hex to int
		mr = int(flag[n] + flag[n+1], 16)
		arr.append(mr)

xored = b''

for i in range(len(arr)):
	xored += bytes([arr[i] ^ key[i % 4]])

print(xored.decode())