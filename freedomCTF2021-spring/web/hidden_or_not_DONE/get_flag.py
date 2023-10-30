#!/usr/bin/python3

from re import findall

import requests
from bs4 import BeautifulSoup

url = "https://infinity.freedomctf.org/"

r = requests.get(url)

fomatted_html = BeautifulSoup(r.text, "html.parser").text

fomatted_html = ''.join(fomatted_html.split())

print(findall("flag{.*?}", fomatted_html)[0])