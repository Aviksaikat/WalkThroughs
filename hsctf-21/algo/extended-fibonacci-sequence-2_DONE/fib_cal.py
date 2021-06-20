#!/usr/bin/python3

def fib(n, computed = {0: 4, 1: 5}) -> int:
	if n not in computed:
		computed[n] = fib(n-1, computed) + fib(n-2, computed)
	#print(computed[n])
	return computed[n]

#print(fib(3))
def sum_(n) -> int:
	sum_of_fibs = 0
	summ = 0
	for i in range(n+1):
		sum_of_fibs += fib(i)
		summ += sum_of_fibs
	
	summ = str(summ)

	if(len(summ) > 10):
		summ = summ[-10:]

	while(summ[0] =='0'):
		summ = summ[1:]
	
	return summ
		


if __name__ == '__main__':
	# while True:
	# 	print(sum_(int(input())))
	
	print(sum_(327))