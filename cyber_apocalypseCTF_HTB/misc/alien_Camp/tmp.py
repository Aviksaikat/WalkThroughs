#!/usr/bin/python3

from pwn import *
import re

# nc 178.62.10.52 30030

context.log_level = "critical"

host = "178.62.10.52"
ip = 30030

s = remote(host, ip)

#promt = s.recv()

#eq = promt.split('\n')[0]
s.recv()
s.sendline(b'1')

#print(pat)
#print(s.recv())
promt = s.recv()


hexaPattern = re.compile(b"(.*) -> (\d+)?")

pat = re.findall(hexaPattern, promt)
print(promt)

s.close()