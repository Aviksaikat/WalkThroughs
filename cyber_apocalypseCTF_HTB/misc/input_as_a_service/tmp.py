#!/usr/bin/python3

from pwn import *

# nc 138.68.187.25 31422

context.log_level = "critical"

s = remote("138.68.187.25", 31422)

promt = s.recv()

#s.recv()
s.sendline(b'1')

print(promt)


s.close()