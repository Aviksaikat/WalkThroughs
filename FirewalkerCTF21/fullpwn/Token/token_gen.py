#!/usr/bin/python3

import jwt

# import requests
# import re

private_key = b"""
-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEA3gqEd71iHRWd0mrXfsMwmQCd3WZii4ZD8dEi4XpWr3MQMzk0
nDkmwAmqUQoCFNDChx/Cz/RyWaPg1QlaeUVBYWAai9he/evKMs+5lLwycnJEmP0z
3Q58g4vpqNiOcPE4Oo2gdl5+/bAhqFtfhnFUZaqUIIRUo0z1q2PnMXJDVoCiUepK
k/b9t2RZBH8UEjAZbnb+cOsB/KDBvyJ0JRjTIXkN1I0MYAwMhDoPpx/7cET+TopD
35U0F/eqW1NjeblBW4DEU+P21DsB91Q07Fc/+FWHswcExpcP2IZsvYV+Rg+n2jUI
SKZJMwWBeRdzuz1eQ4z/YYWsizJPgtqH1SjtvQIDAQABAoIBAGJvizaCUQLP2H22
O/7Ijbzm1xWWFE4CohCMRMhtMgzqF959l+NCOvmbz1PJ+g48VmENJZKHrkIrMrt/
QArPNyLyNhKVQ9eSNru792wG2t595gdlCR8REwZGeroN92f+qIzcyKxxTB8vfFxk
1b6Gc4H202BvCg6zSZ5H1fDH1S59WPSHQERJfSATcOQv6h5fGk2/IGuaJZNmTrXC
IJ6kGg9GHDcBGEZK218B+QsP9lMBpyykxkmuobe7PfQWoujOdh1GttSPl3MsZEmt
qj1Ca+6VRvx8Za+mqRxwc531CPk3uk728p3lSvqyQzC4QuoQiGQcOHb+1stwMtv9
DVl4mQkCgYEA9qqA5O8TAbHTViUDMtjlOKpOH2T+fYRTjFc8EcbFgLDxuq3GEI0q
e8kgcm8sX6C8/Pj/cdtkfYVIw9I+j+ZL4kH7JCcSeL+OBJ3yhJ+QkeioDsH2Rt+v
N1GHxEDHvNejWSJkxrnM6jSEbjdb8FIbRBK8dPlLNs5kCsWxTK+tkr8CgYEA5nF3
xRdDBuqL3+VYVTGrOylVqnR9bvB8sy0Rsll9l4ZTcve2y4s8e2i0JObPNMyotfFu
GvgKVkN62MvCWFR8V6XS6pnGDjURKO26Hk7ijEm3C4/QIwBC28uevTmlrN0jX2r8
j/hWW9cAZdOUdySEQTx1JWKT5S3KorwjxiEcqoMCgYEA9K3DN9STBP5RRcVnO9v8
3M3Kuseizf0iJzctRfDnXzWmQ2g27ZoqRyoGPp1a5ez7KvEP6vAW6Y/50w1Ns85c
/a43ofAEGbTh+mB2/emOLb4cXq82Ta17ECOWyiz8NK2uwi8kyh/qTXQU3YOadnPr
ygXP3TSg0FfA0xKxQgGN6t8CgYA/6h6/AnmrtGgBPHoofvMwIIHLGi4kE/1yMMDk
x59m5HHGxF/lyoOG8v5r8bxst4rfk8vnHP64+FRdRv5rQ1uNb8e1G9tr21ocEPt7
JoP9RwDG6ydeXdctYSdw8kk6Tcde0qykPcuuA07v7yQRe4ZXFa6kJNhCS1YVlrsR
W+O4gwKBgQDJEFpAwCY01ycroOYKE+zOSHw6MvYmMnAYc+Qg1NBJlJxSUfuSmp8a
uJB48F45Wgpad1gcp99GKgkLciWI3qVya1jAPbQvz80z6Zthx3W98bs/nvHIuI1E
/T2tgeDV/YiIs4a+uE3srfh0X4SVpyH1kigepD+oOkMnd2l3vgCbSA==
-----END RSA PRIVATE KEY-----
"""


encoded_jwt = jwt.encode({"user": "administrator"}, "my-very-secret-pass-phrase", algorithm="HS256")

#encoded_jwt = jwt.encode({"user": "admin"}, "my-very-secret-pass-phrase", algorithm="HS256")

print(encoded_jwt)

#print(jwt.encode(encoded_jwt, private_key))