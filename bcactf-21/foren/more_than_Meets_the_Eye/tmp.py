#!/usr/bin/python3

import zwsp_steg

with open("zwsp.txt", "rb") as f:
	data = f.read().encode()

decoded = zwsp_steg.decode(data, zwsp_steg.MODE_ZWSP)
print(decoded)