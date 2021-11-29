#!/usr/bin/python3
from pwn import *

r, f = map(unhex, read("output.txt").decode().split())
#print(r) 
#print(f)

print(xor(f, r, b"No right of private conversation was enumerated in the Constitution. I don't suppose it occurred to anyone at the time that it could be prevented.")[:len(f)])

