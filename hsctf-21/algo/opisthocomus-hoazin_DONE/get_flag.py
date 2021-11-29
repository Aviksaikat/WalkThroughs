#!/usr/bin/python3

import tmp
from pwn import * 
import re

#print(tmp.eval("191m80m687a912a670a438m817a149m268a959m438m614a681m501a196m634m782m447m468a665a900a797m129m234m456m537m219m728a863a786a987m527a541m604m303m996m93m375a806m804m888m100m540a900m180a359a139a865m41a763a246"))


c = connect("not-really-math.hsc.tf", 1337)
c.recv()

print("[*]Getting the flag")
while(True):
	prompt = c.recvuntil('\n')
	if(b"flag" in prompt):
		print(re.findall("flag{.*}", prompt.decode())[0])
		exit(0)
	#print(prompt)
	prompt = re.findall(r"[0-9][a|m]*", (prompt.decode()))
	#print(prompt)
	ans = str(tmp.eval(''.join(prompt)))
	#print(ans)
	#break
	c.sendline(ans.encode())
	#print(prompt)
	#print(c.recv())
	

#print(prompt)
	