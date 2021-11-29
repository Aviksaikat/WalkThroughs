#!/usr/bin/python3

from pwn import *
"""
vals = 1, 2

combs:
1 + 1 + 1 + 1 + 1
2 + 1 + 2
..
..
"""
# https://www.geeksforgeeks.org/ways-to-represent-a-number-as-a-sum-of-1s-and-2s/

def multiply(F, M):
 
    x = F[0][0] * M[0][0] + F[0][1] * M[1][0]
    y = F[0][0] * M[0][1] + F[0][1] * M[1][1]
    z = F[1][0] * M[0][0] + F[1][1] * M[1][0]
    w = F[1][0] * M[0][1] + F[1][1] * M[1][1]
 
    F[0][0] = x
    F[0][1] = y
    F[1][0] = z
    F[1][1] = w
 
# Power function in log n
def power(F, n):
 
    if( n == 0 or n == 1):
        return
    M = [[1, 1],[1, 0]]
 
    power(F, n // 2)
    multiply(F, F)
 
    if (n % 2 != 0):
        multiply(F, M)
 
#/* function that returns (n+1)th Fibonacci number
# Or number of ways to represent n as sum of 1's
# 2's */
def countWays(n):
    F = [[1, 1], [1, 0]]
    if (n == 0):
        return 0
    power(F, n)
 
    return str(F[0][0] % 10000)
 
# Driver Code
#n = 5

# nc hopscotch.hsc.tf 1337
c = connect("hopscotch.hsc.tf", 1337)

c.recv()

print("[*]Getting the flag")
while True:
	prompt = c.recvuntil('\n')
	#print(prompt)
	if(b"flag" in prompt):
		print(re.findall("flag{.*}", prompt.decode())[0])
		exit(0)
	
	n = re.findall(r"[0-9]+", prompt.decode())[0]

	#print(n)
	ans = countWays(int(n))

	c.sendline(ans.encode())
	

