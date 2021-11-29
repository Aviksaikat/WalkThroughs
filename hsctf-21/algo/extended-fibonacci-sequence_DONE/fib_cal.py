#!/usr/bin/python3


def fib(n, computed = {0: 0, 1: 1}):
	if n not in computed:
		computed[n] = fib(n-1, computed) + fib(n-2, computed)
	return computed[n]


def sum_(n):
	s = ""
	summ = 0
	for i in range(n+1):
		s += str(fib(i))
		summ += int(s)
		# print(f"s:{s}")
		# print(f"sum:{summ}")
	
	summ = str(summ)

	if(len(summ)>11):
		summ = summ[len(s) - 12:]

	while(summ[0] =='0'):
		summ = summ[1:]
	#print(summ)
	return summ

if __name__ == '__main__':
	while True:
		print(sum_(int(input())))