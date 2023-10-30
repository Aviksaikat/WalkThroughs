#!/usr/bin/python3

import requests
from pycookiecheat import chrome_cookies

url = "http://178.62.14.240:30251/"

# Uses Chrome"s default cookies filepath by default
cookies = chrome_cookies(url)
r = requests.get(url, cookies=cookies)
print(r.text)