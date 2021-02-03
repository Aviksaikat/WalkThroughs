#!/usr/bin/python3

#not like this dosen't work :(

dna ="ACC AGT AAA ACG {GCC ACA GTC_GTC GAG TCG ACG AAA ATA TCG AAC TCG GAA GAG GCT}"

trans_dict = {"A":"0", "C":"0", "G":"1", "T":"1"}

trans_table = str.maketrans(trans_dict)

t = dna.translate(trans_table)

decoded = [chr(int(t[i:i+8],2)) for i in range(0, len(t), 8)]

print(decoded)

