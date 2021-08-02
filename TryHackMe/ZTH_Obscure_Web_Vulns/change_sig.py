#!/usr/bin/python3

import jwt

public = open("public.pem", 'r').read()
#print(public)

data = {
  "iss": "Paradox",
  "iat": 1627800736,
  "exp": 1627800856,
  "data": {
    "pingu": "noots"
  }
}
with open("new_header", 'w') as f:
  f.writelines(jwt.encode(data, key=public, algorithm="HS256").decode())