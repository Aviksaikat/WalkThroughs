#!/usr/bin/python3
from re import findall

from pwn import *

#debug_level = "critical"
context.log_level = 'error'

# context.log_level = 'debug'

passord = "sup3r_s3cr3t_p455w0rd_f0r_u!"

io = connect("165.22.122.151", 31762)

io.sendlineafter('"What is the password for this week\'s meeting?" ', passord.encode())
io.sendlineafter("$ ", "cat flag.txt")

io.recv()

flag = findall("HTB{.*}", io.recv().decode())[0]

with open("flag.txt", 'w+') as f:
	f.write(flag)

print(flag)

