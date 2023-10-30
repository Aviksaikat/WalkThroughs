#!/usr/bin/python3

from base64 import b64decode, b64encode

from Crypto.Util.number import bytes_to_long, long_to_bytes
from pwn import *

debug_level = "critical"


#c = remote("rsa101.sstf.site", 1104)

# c.recvline()
# n = bytes_to_long(c.recvline())

n = 0x99f060a7e9466ab087567f029ccfa075719c31ab7143c8e987698cc4abdf3580875f9f946c2d4fb8e9c4107b9d157b515117daf81f3e00ea2d75e3f9e3bdb343779ae3c3e2fc599e737b8e2d8341da4fb33bbb1f7695eacb5f0070f5ece1a57c5fcd89647672782062702a8c2e6eee4c7ef47a15f1a7286bc771a00e9c89634f

c = int(b"cat flag".hex(), 16)

for i in range(2, c // 2):
	if(c % i == 0):
		#print(i)
		break
m1 = i
m2 = c // m1


encode1 = b64encode(long_to_bytes(m1))
encode2 = b64encode(long_to_bytes(m2))

# Zw==
# 9wEgoA/3AQ==
# print(encode1)
# print(encode2)

s1 = bytes_to_long(b64decode("YioEpCWoCA/+e75D00cCALLeyjaKPPRuk0K0Us4vJV6gyxOenZ7oj7GvsPdh5mLKiHcfLOIuzyHW53xSWv8rAyiNeIZzn+2r4+rV5yz3+Tbo/OEexfzN8WMGEAsCp6f9rdcDQ3VzUhHdo75xR5Y3HRtBZB9dVq4YfdGW2IATNKI="))

s2 = bytes_to_long(b64decode("SxUeJGLwVKMfPhiRrqnIdYKGkdIBMwXr9WYd2wt8mhTWTC/lAR2bVt0wxpPh+GNlbahYGJ8i4o4Ik4Ql2/84NVPYSU1ymTORXkmaDNK85vk92MP/fmkzelHpR46/egrAeKxfRGlSJUNeIU5BVha9EH8lEn8E3f1QPA/gW0ALxC8="))

# print(s1)
# print(s2)

payload = b64encode(long_to_bytes((s1 * s2) % n ))

print(payload)