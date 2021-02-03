#!/usr/bin/env python3 
import jwt

key = "my_Nice_secret_key"

new_header = "eyJ0eXAiOiJKV1QiLCJhbGciOiJub25lIn0K"

new_payload = "eyJ1c3IiOiJhZG1pbiIsImFkbWluIjp0cnVlfQo"

#data = new_header+"."+new_payload

sig = jwt.encode(data,key, algorithm='HS256')