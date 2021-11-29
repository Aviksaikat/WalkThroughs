#!/usr/bin/python3

from socket import *


def recv(s):
	try:
		data = s.recv(1024)
		return data
	except Exception as e:
		print(str(e))


HOST = "10.10.88.10"
PORT = 4000
SERVER = (HOST, PORT)
s = socket(AF_INET, SOCK_DGRAM)
#s.sendto(b"hello", 0, (HOST, PORT))
#s.connect((HOST, PORT))
s.sendto(b"hello", SERVER)
print(recv(s))
s.sendto(b"final", SERVER)
print(recv(s))