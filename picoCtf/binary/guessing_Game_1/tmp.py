#!/usr/bin/env python3
#works kind of not for the sol. for this prob.

import random
import re

from pwn import *

context.log_level = 'critical'
#nc jupiter.challenges.picoctf.org 50581
c = remote("jupiter.challenges.picoctf.org",50581)

promt = c.recv()

#print(promt)
while(1):
	data = str(random.randint(10,100))
	c.sendline(data)
	print(c.recv())
	received = c.recv()
	num =re.findall(r"\d+",str(received))
	#print(num)
	if(num):
	 	data2 = str(num)
	 	c.sendline(data2)
	 	print(c.recv())
	 	break

c.close()





