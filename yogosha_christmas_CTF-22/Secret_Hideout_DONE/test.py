#!/usr/bin/python3
from requests import get, post

l = ["Victor", "Amado", "Boro", "Code", "Delta", "Kashin Koji", "Jigen", "victor", "amado", "boro", "code", "delta", "kashin koji", "jigen", "VICTOR", "AMADO", "BORO", "CODE", "DELTA", "KASHIN KOJI", "JIGEN", "o//"]

url = "http://34.227.78.164/"

for i in l:
	#print({"User-Agent": i})
	r = get(url + "secret", headers={"User-Agent": i})
	print(r.text)