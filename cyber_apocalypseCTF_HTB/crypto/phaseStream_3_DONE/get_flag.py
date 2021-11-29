#!/usr/bin/python3
from pwn import xor, unhex

#https://crypto.stackexchange.com/questions/2991/why-must-iv-key-pairs-not-be-reused-in-ctr-mode

with open("output.txt","rb") as f:
    l = f.read().split()

txt_encoded = unhex(l[0])
flag_encoded = unhex(l[1])

#print(txt_encoded)
#print(flag_encoded)

flag = ""
plain_txt = b"No right of private conversation was enumerated in the Constitution. I don't suppose it occurred to anyone at the time that it could be prevented."

for i in range(len(flag_encoded)):
    flag += xor(txt_encoded[i], flag_encoded[i],plain_txt[i]).decode()

print(flag)
