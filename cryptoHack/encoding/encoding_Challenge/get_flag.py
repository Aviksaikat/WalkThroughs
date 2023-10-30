#!/usr/bin/env python3

import codecs
import json

from Crypto.Util.number import long_to_bytes
from pwn import *

r = remote("socket.cryptohack.org", 13377, level = "debug")

def json_recv():
    line = r.recvline()
    return json.loads(line.decode())

def json_send(hsh):
    request = json.dumps(hsh).encode()
    r.sendline(request)

def decoded(type_, encoded_text)->str:
	
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


#json_recv()


for i in range(0,101):
	received = json_recv()
	
	if("flag" in received):
		print("[*] FLAG: {}".format(received["flag"]))
		break

	
	#print("Received type: ")
	#print(received["type"])
	type_ = received["type"]

	#print("Received encoded value: ")
	#print(received["encoded"])
	encoded_text = received["encoded"]	

	print(f"\n[-] Cycle: {i}")
	print(f"[-] Received type: {type_}")
	print(f"[-] Received encoded value: {encoded_text}")

	to_send = {
    			   #string 
    	"decoded": decoded(type_, encoded_text)
	}

	json_send(to_send)

  	# print("[-] Decoded: {}".format(decoded))
	# print("[-] Decoded Type: {}".format(type(decoded)))
	