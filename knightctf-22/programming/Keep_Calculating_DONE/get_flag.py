#!/usr/bin/python3

def fn(x, y):
	sum_ = 0
	while x != 667:
		sum_ += (x * y) + int(str(x) + str(y))
		#print(f"x={x}, y={y}")
		x += 1  
	return sum_

print("KCTF{%s}" % fn(1,2))
