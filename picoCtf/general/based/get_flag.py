#!/usr/bin/env python3

# nc jupiter.challenges.picoctf.org 29956

from pwn import * 
import re



c = remote("jupiter.challenges.picoctf.org",29956)

promt = c.recv()
binary = str(promt).split('\n')[0]
#print(c.recv())
#print(binary)

temp = re.findall(r'\d+', binary) 
res = list(map(int, temp)) 

#print(res[:len(res)-1])
#print(res)

filtered_list = res[:len(res)-1]

#final_res = int("".join(str(x) for x in filtered_list), 2) 
result = ""
for i in filtered_list:
	n = int(i, 2)
	result += n.to_bytes((n.bit_length() + 7) // 8, 'big').decode()

print(result)
c.close()