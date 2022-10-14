#!/usr/bin/python3

def gcd(a, b):
	if(b == 0):
		return a
	else:
		return gcd(b, a % b)

sum_ = sum(map(int, list(str(gcd(21525625, 30135875)))))

print("KCTF{%s}" % (sum_ * 1234))
