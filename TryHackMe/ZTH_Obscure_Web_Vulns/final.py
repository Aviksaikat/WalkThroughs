#!/usr/bin/python3

with open("new_header", 'r') as f:
	header_pay = f.read()

#print(header_pay)

with open("new_sig", 'r') as f:
	sig = f.read()

print(f"{header_pay}.{sig}")