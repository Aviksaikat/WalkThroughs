#!/usr/bin/python3

def g_sum(n):
	if n < 0 :
		return 0
	return 1/(pow(2,n)) + g_sum(n-1)

print("KCTF{%s}" % g_sum(25))