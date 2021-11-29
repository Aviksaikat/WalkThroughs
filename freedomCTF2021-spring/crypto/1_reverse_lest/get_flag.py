#!/usr/bin/python3
from textwrap import wrap


txt = "ct1a0aF_i_nrbut1t0ryX_XXXXXX1X"

print(txt)
i = 1
while(i <= 5):
	new_txt = wrap(txt, i)
	i += 1
	c = 0
	d = new_txt[len(new_txt) - 1]
	for j in d:
		if(j == 'X'):
			c+=1
	#print("d->",*new_txt)
	
	if(c == len(d) and i > 2):
		new_txt = new_txt[:-1]
	print(*new_txt)
	
	for j in range(len(new_txt)):
		new_txt[j] = new_txt[j][::-1]
	txt = ''.join(new_txt)
	
	#for printing spaces
	print(*new_txt)
	print()

#print(txt)

flag = txt
if('X' in flag):
	flag = flag.replace('X', '')

#print(flag)
print("flag{%s}" % (flag))