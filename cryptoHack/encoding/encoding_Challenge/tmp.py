#!/usr/bin/env python3
import codecs

from Crypto.Util.number import long_to_bytes
from pwn import *


def decoded(type_,encoded_text):
	
	decoded = ""
	
	if type_ == "base64":
		decoded = str(base64.b64decode(encoded_text)).strip('b').strip("'")
	elif type_ == "hex":
		decoded = codecs.decode(encoded_text, "hex").decode("utf-8")
	elif type_ == "rot13":
	 	decoded = codecs.decode(encoded_text, "rot_13")
	elif type_ == "bigint":
	 	decoded = str(long_to_bytes(int(encoded_text,0))).strip('b').strip("'")
	elif type_ == "utf-8":
	 	decoded = "".join([chr(b) for b in encoded_text])

	return decoded

print(decoded("base64","aG9vaGhhaGE="))