#!/usr/bin/python3
import os
from binascii import unhexlify

#flag = bytearray.fromhex("134af6e1")

class XOR:
	def __init__(self):
		self.key = os.urandom(4)
	def decrypt(self, data: bytes) -> bytes:
		xored = b''
		for i in range(len(data)):
			xored += bytes([data[i] ^ self.key[i % len(self.key)]])
		return xored


def main():
	print("[*]Brute-forcing the key!!")
	while True:
		crypto = XOR()
		cipher = crypto.decrypt(b"HTB{").hex()
		if cipher == "134af6e1":
			print(cipher.key)
			break

if __name__ == '__main__':
	main()
