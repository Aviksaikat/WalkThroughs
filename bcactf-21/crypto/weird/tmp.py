#!/usr/bin/python3

with open("ciphertext.md", 'r') as f:
	data = f.read()

#print(data)

unique_data = []

for i in data:
	if i not in unique_data:
		unique_data.append(i)

#print(unique_data)

for j in unique_data:
	print(chr(ord(j) % 26))
