#!/usr/bin/python3

"""
Let x = 1

Let calculation = (x*(x+1)) + (2 *(x + 1))

Let reversed_calc = reversed number of calculation [for example if calculation = 123, reversed_calc will be 321]

If reversed_calc can be divided by 4 without reminder then answer = answer + reversed_calc

Repeat all the calculations until you have x = 543

The final answer will be the flag when x = 543
"""

def reversed_calc(n):
	return int(str(n)[::-1])


def fn(x):
	ans = 0
	while x != 544:
		cal = (x*(x+1)) + (2 *(x + 1))
		rev_n = reversed_calc(cal)
		if rev_n % 4 == 0:
			ans += rev_n

		#print(ans)
		x += 1
	return ans

print("KCTF{%s}" % fn(1))