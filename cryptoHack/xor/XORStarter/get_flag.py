#!/usr/bin/env/python3

from sys import argv
import os

#print(f"Usage: {argv[0]} <string>")

l = []
for i in argv[1]:
	#print(chr(ord(i)^13),end="")
	l.append(chr(ord(i)^13))

string = ''.join(l)

print("crypto{%s} " % (string))