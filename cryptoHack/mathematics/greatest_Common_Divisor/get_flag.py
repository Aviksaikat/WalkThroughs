#!/usr/bin/env python3

"""
based on  Euclid's algorithm
https://en.wikipedia.org/wiki/Euclidean_algorithm

The Euclidean algorithm is based on the principle 
that the greatest common divisor of two numbers does 
not change if the larger number is replaced by its 
difference with the smaller number. 

function gcd(a, b)
    while a ≠ b 
        if a > b
            a := a − b
        else
            b := b − a
    return a
"""
def gcd(a,b):
	if(b==0):
		return a
	else:
		return gcd(b,a%b)


print(gcd(66528,52920))