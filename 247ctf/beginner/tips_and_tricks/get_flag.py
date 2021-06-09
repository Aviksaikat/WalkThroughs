#!/usr/bin/python3

from pwn import *
import re

#* tcp://1986c693c18bc0fa.247ctf.com:50406 

debug_mode = "critical"

host = "1986c693c18bc0fa.247ctf.com"
port = 50406 
c = connect(host, port)

#prompt = c.recv().decode()
#print(prompt)

prompt = ""
count = 1
print("[*] Getting the flag")
while(len(re.findall("247CTF{.*", prompt)) == 0):
    print(count)
    prompt = c.recv().decode()
    digits = re.findall("[0-9]+", prompt)
    #print(digits)
    #* to stay in the range
    res = int(digits[2 % len(digits)]) + int(digits[3 % len(digits)])

    c.sendline(b"%d\r\n" % res)

    #print(c.recv())
    count += 1

#print(prompt)

print(re.findall("247CTF{.*", c.recv().decode())[0].strip('\r'))
#print(re.findall("247CTF{.*", prompt.strip('\r'))[0])