#!/usr/bin/python3
'''
Looking again at Fermat's little theorem...
if p is prime, for every integer a:
        pow(a, p) = a mod p
and, if p is prime and a is an integer coprime with p:
        pow(a, p-1) = 1 mod p
We can do some magic like this:
Note: i'll use math notation, so a^b means pow(a,b)
        a^(p-1) = 1 (mod p)
        a^(p-1) * a^-1 = a^-1 (mod p)
        a^(p-2) * a * a^-1 = a^-1 (mod p)
        a^(p-2) * 1 = a^-1 (mod p)
So finally we have:
        a^(p-2) = a^-1 (mod p)
So, doing a^(p-2) and then (mod p) we can achieve
our result
'''
"""
The problem given is 3 * d ≡ 1 mod 13
To calculate d we can divide both sides by 3 which gives us
  d = (1/3) * 1 mod 13
which is equivalent to
  d = 3^-1 mod 13, where ^ symbol is raised to the power of
We can easily convert this into python equation using the pow function
"""
a = 3
p = 13
print(pow(a,p-2) % p)
