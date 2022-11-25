#!/usr/bin/python3

msg = "[GQh{'f}g wLqjLg{ Lt{#`g&L#uLpgu&Lc'&g2n"

flag = []

for i in range(40):
	flag.append(chr(ord(msg[i]) ^ 19))
	
print(''.join(flag))
