#!/usr/bin/python3

import re

from fib_cal import sum_
from pwn import *

debug_mode = "critical"

#nc extended-fibonacci-sequence-2.hsc.tf 1337

c = connect("extended-fibonacci-sequence-2.hsc.tf", 1337)

#c.recv()
#prompt = c.recv()

#print(n)
print("[*]Getting the flag")

while True:
	print("p1", c.recv())
	print("p2", c.recv())
	prompt = c.recv()
	print("p3", prompt)
	
	if(b"flag" in prompt):
		print(re.findall("flag{.*}", prompt.decode())[0])
		exit(0)
	
	n = re.findall(r"[0-9]+", prompt.decode())[1]
	#print(n)
	
	ans = sum_(int(n))
	#print(ans)
	c.sendline(ans.encode())