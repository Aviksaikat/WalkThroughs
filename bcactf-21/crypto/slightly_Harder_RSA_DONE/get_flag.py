#!/usr/bin/python3

from Crypto.Util.number import inverse

n = 947358141650877977744217194496965988823475109838113032726009
e = 65537
ct = 811950322931973288295794871117780672242424164631309902559564

p = 884666943491340899394244376743
q = 1070864180718820651198166458463

phi = (p - 1) * (q - 1)

d = inverse(e, phi)

m = pow(ct, d, n)

print(bytes.fromhex(hex(m)[2:]).decode("ascii"))