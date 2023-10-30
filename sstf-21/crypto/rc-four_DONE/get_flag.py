#!/usr/bin/python3

from binascii import unhexlify

from pwn import xor

debug_level = "critical"

msg = b"RC4 is a Stream Cipher, which is very simple and fast"

with open("output.txt", 'rb') as f:
	data = f.readlines()

ct = unhexlify(data[0].strip())
decrypted_flag = unhexlify(data[1].strip())
#print(ct)

key = b""

for i in range(len(msg)):
	key += xor(msg[i], ct[i])

#print(key)

flag = b""

for i in range(len(key)):
	flag += xor(key, decrypted_flag)

print(flag[:48].decode())