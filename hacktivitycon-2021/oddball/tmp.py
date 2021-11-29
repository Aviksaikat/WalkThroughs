#!/usr/bin/python3


with open("oddball", 'r') as f:
	data = f.read().strip().split(' ')

for i in range(len(data)):
	if int(data[i]) % 2 != 0:
		print(data[i], end=' ')