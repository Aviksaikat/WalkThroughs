#!/usr/bin/python3

import random
from math import gcd


def encrypt(dt):
	mod = 256
	while True:
		a = random.randint(1,mod)
		if gcd(a, mod) == 1: break
	b = random.randint(1,mod)

	res = b''
	for byte in dt:
		enc = (a*byte + b) % mod
		res += bytes([enc])
	return res

dt = open('encrypted.bin', 'rb').read()

res = encrypt(dt)

f = open('jadu.pdf', 'wb')
f.write(res)
f.close()
