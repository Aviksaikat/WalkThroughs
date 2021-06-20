#!/usr/bin/python3

from fib_cal import sum_
from pwn import *
import re

debug_mode = "critical"

#nc extended-fibonacci-sequence.hsc.tf 1337

c = connect("extended-fibonacci-sequence.hsc.tf", 1337)
c.recv()

print("[*]Getting the flag")
while True:
	prompt = c.recvuntil('\n')
	#print(prompt)
	if(b"flag" in prompt):
		print(re.findall("flag{.*}", prompt.decode())[0])
		exit(0)
	n = re.findall(r"[0-9]+", prompt.decode())[0]

	#print(n)
	ans = sum_(int(n))

	c.sendline(ans.encode())
	