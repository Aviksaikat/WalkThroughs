#!/usr/bin/python3

#* script may look simple(and yes it is but) it took me > 1 hour to find out what was happening too many requests going on in the burp proxy it was a total mess
from json import loads

from requests import get

url = "https://phaleroviatalk.freedomctf.org/"

r = get(url + "open-channel/6")

json_data = loads(r.text)

#print(json_data)
print(json_data[1]["message"])