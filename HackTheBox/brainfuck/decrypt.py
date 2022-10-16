#!/usr/bin/python3
from vigenere import decrypt

pt = "Orestis - Hacking for fun and profit"
ct = "Pieagnm - Jkoijeg nbw zwx mle grwsnn"

# remove spaces & make it a single str

plaint_txt = ''.join(pt.replace('-', '').split(' '))
cipher_txt = ''.join(ct.replace('-', '').split(' '))

pt = [ ord(i) for i in plaint_txt ]
ct = [ ord(j) for j in cipher_txt ]

# print(pt)
# print(ct)

key = ''.join(list(map(lambda x,y: chr((y-x) % 26 + ord('a')), pt, ct)))

print(f"Key Found: {key}")
print(f"Actual Key: fuckmybrain")


# final_ct = "Ybgbqwplgwltoudgnjufcpp,CjybczfuzrryolqpzfuzxjsrkeqxfrlojwceecJuovgmnvze://zsrivszwm.rfz/8cr5ai10r915218697i1w658enqc0cs8/ozrxnkc/ub_sja"

# print(decrypt(final_ct, "fuckmybrain", base64=False))
