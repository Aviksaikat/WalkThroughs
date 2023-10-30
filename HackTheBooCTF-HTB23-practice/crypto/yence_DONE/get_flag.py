#!/usr/bin/python3
from Crypto.Util.Padding import pad
from pwn import xor


def load_data():
	with open('messages.txt') as f:
	# source script used padding too so we need to align with it.
		msgs = [pad(m.encode(), 16) for m in eval(f.read())]
	with open('output.txt') as f:
		cts = [bytes.fromhex(line.strip()) for line in f.readlines()]
	
	return msgs, cts

def blocks(m):
	return [m[i:i+16] for i in range(0, len(m), 16)]



def recover_flag(M, C):
	F0 = xor(C[2][0], C[1][1], M[1][1])
	F1 = xor(C[2][1], C[1][2], M[1][2])
	F2 = xor(C[2][2], C[3][1], M[3][1])
	F3 = xor(C[2][3], C[3][2], M[3][2])
	
	return F0+F1+F2+F3

def pwn():
	msgs, cts = load_data()
	M = [blocks(m) for m in msgs]
	C = [blocks(c) for c in cts]
	f = recover_flag(M, C)
	print(f.decode().strip().replace("", ""))
	
pwn()