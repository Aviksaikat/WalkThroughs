#!/usr/bin/python2
from pwn import *
from paddingoracle import BadPaddingException, PaddingOracle
import json
from binascii import hexlify, unhexlify
from Crypto.Cipher import AES

class PadBuster(PaddingOracle):
	
	def __init__(self, **kwargs):
		super(PadBuster, self).__init__(**kwargs)
		self.io = remote("188.166.174.107", 30076)
		self.wait = kwargs.get('wait', 2.0)
	
	def get_encrypted_flag(self):
		self.io.recvuntil("2. Send your encrypted message.\n")
		self.io.sendline("1")
		return self.io.recvline()
	
	def oracle(self, data):
		while True:
			try:
				self.io.recvuntil("2. Send your encrypted message.\n")
				self.io.sendline("2")
				self.io.recvuntil("Enter your  ciphertext:\n")
				s = data
				s = hexlify(data)
				self.io.sendline(s)
				out = self.io.recvline()
				log.info(out)
				if b"Invalid ciphertext" in out:
					raise BadPaddingException
				return
			except (socket.error, socket.gaierror, socket.herror, socket.timeout) as e:
				print(str(e))


if __name__ == '__main__':
	padbuster = PadBuster()
	data = unhexlify(padbuster.get_encrypted_flag().strip())
	print(data)
	iv = data[:AES.block_size]
	enc = data[AES.block_size:]
	print(iv)
	print(enc)
	dec = padbuster.decrypt(enc, block_size=AES.block_size, iv=iv)
	print(dec)
