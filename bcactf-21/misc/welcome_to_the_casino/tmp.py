#!/usr/bin/python3

# nc misc.bcactf.com 49156
import multiprocessing

from pwn import *

debug_mode = "critical"

def connect():
	s = remote("misc.bcactf.com", 49156)
	s.recvuntil(b"Enter")
	promt = str(s.recv())

	letter = promt.split('"')[1]

	s.sendline(letter)
	s.recv()
	s.recv()
	res = s.recv()
	#print(s.recv())
	return res

res = connect()

while True:
	if(b"bcactf"  in res):
		res = connect()
		exit(1)



s.close()

# connect(s1)
# connect(s2)
# connect(s3)


# pool = multiprocessing.Pool()
# s1 = remote("misc.bcactf.com", 49156)
# s2 = remote("misc.bcactf.com", 49156)
# s3 = remote("misc.bcactf.com", 49156)
# l = [s1, s2, s3]	

# outputs_async = pool.map_async(connect, l)

# output = outputs_async.get()
# print(output)
