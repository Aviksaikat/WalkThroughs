#!/usr/bin/python3

import base64
import binascii
from sys import argv

with open("new_hex", 'rb') as f:
	hexx = f.read().strip(b'\n')

data = base64.urlsafe_b64encode(binascii.a2b_hex(hexx)).decode().replace(',', '')

#print(data)
with open("new_sig", 'w') as f:
	f.writelines(data)

