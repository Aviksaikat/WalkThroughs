#!/usr/bin/python3
from re import findall
from sys import argv

from pwn import *

context.log_level = "critical"

try:
	c = connect(argv[2], int(argv[3]))
except:
	c = connect("challenge.nahamcon.com", 32277)
else:
	print("[!]Opps can't connect")

print("[*]Connected!....")
print("[*]Getting the flag....")

c.recvuntil(b":")
c.sendline(b"abcd")
c.recvuntil(b":")
c.sendline(b"1337")

data = c.recvuntil(b"TO")

flag = findall(b"flag{.*}", data)[0].decode()
print(flag)


