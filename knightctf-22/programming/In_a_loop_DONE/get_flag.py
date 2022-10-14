#!/usr/bin/python3

flag = r"CFb5cp0rm1gK{1r4nT_m4}6"

while flag[:5] != "KCTF{":
	flag = list(flag)
	for i in range(len(flag)):
		for j in range(i, len(flag) - 1):
			flag[j], flag[j+1] = flag[j+1], flag[j]
	
	flag = ''.join(flag)

print(flag)