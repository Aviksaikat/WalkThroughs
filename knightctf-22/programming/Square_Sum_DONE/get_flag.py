#!/usr/bin/python3

def sumSquare(n):
	l1 = []
	i = 1
	while pow(i, 2) <= n:
		j = 1
		while(pow(j, 2) <= n) :
			if (i * i + j * j == n) :
				#print(i, "^2 + ", j , "^2" )
				if i not in l1:
					l1.append(i)
				if j not in l1:
					l1.append(j)
			j = j + 1
		i = i + 1

	return l1

l = sumSquare(25000)

print("KCTF{%s,%s}" % (l[-2], l[-1]))