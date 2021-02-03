#!/usr/bin/env python3

str = input("Enter your password ")
passstr82 = ''
for s in str[5:9]:
    passstr82 += chr(ord(s) ^ 15)
passstr43 = ''
if passstr82 == 'zld|':
    for s in str[:5]:
        passstr43 += chr(ord(s) ^ 5)

passstr22 = ''
if passstr43 == 'vqdwg':
    for s in str[9:12]:
        passstr22 += chr(ord(s) ^ 37)                    
passsrt32 = ''
if passstr22 == 'zSD':
    for s in str[12:17]:
        passsrt32 += chr(~ord(s)*-1)

passsrt95 = ''
if passsrt32 == 'ot`ib':
    for s in str[17:]:
        passsrt95 += chr(~ord(s)*-4)

if passsrt95 == 'ƴƴǀǠƘƘƼ':
    with open('flag.txt', 'r') as f:
        print(f.read())
else: 
    print("vag")