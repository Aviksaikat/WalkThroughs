#!/usr/bin/env python3

"""
The extended Euclidean algorithm is an efficient way to find 
integers u,v such that

p * u + q * v = gcd(p,q)

gcd of 2 prime no.s is also prime
"""

p = 26513
q = 32321

# function for extended Euclidean Algorithm 
def gcdExtended(a, b): 
    # Base Case 
    if a == 0 :  
        return b, 0, 1
            
    gcd, x1, y1 = gcdExtended(b%a, a) 
    
    # Update x and y using results of recursive 
    # call 
    x = y1 - (b//a) * x1 
    y = x1 
    
    return gcd, x, y
     
 
# Driver code

g, u, v= gcdExtended(p, q) 
#print(f"gcd({p},{q}) = ", g) 
#print("u=%s,v=%s" % (u, v))
print("crypto{%s,%s}" % (u, v))
