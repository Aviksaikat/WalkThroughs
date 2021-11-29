#!/usr/bin/python3

flag = open("output.txt",'r').read() 


letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
decoded = ""

for character in flag[0:len(flag)-1]:
    decoded += letters[(letters.index(character)-18)%26] 

print(f"flag{{{decoded}}}")
