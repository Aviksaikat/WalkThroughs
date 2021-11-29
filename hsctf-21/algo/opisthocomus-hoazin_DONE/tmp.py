#!/usr/bin/python3

def eval(n):
    l = []
    s = ""
    for i in n:
    	if(i == 'm' or i == 'a'):
    		l.append(int(s))
    		s = ""
    		l.append(i)
    	else:
    		s += i
    #print(s)

    if(s != ""):
    	l.append(int(s))
    #print(s)

    while 'a' in l:
    	a = l.index('a')
    	l[a-1] = ((l[a-1] + l[a+1]) % ((2 ** 32) - 1))
    	l.pop(a)
    	l.pop(a)
    #print(l)

    while 'm' in l:
    	m = l.index('m')
    	l[m-1] = ((l[m-1] * l[m+1]) % ((2 ** 32) - 1))
    	l.pop(m)
    	l.pop(m)
    #print(l)

    #print(l[0] % ((2 ** 32) - 1))
    return l[0] 


if __name__ == '__main__':
    while True:
        n = input()
        print(eval(n))
    # n = "2m3a19m2a38m1"
    # print(eval(n))