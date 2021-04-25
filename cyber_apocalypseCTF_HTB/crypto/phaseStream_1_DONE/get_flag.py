#!/usr/bin/python3

# convert the str to bytes
encrypted_msg = bytes.fromhex("2e313f2702184c5a0b1e321205550e03261b094d5c171f56011904")

"""
we know the first 5 letters of the flag so can use it to make the key 
as 
2 ^ 1 = 3
2 ^ 3 = 1 

so if we xor with the result with the key we can get the original text
"""

flag_format = b"CHTB{"

# xoring mutual elements of both of the bytes array 

key = [o1 ^ o2 for (o1, o2) in zip(encrypted_msg, flag_format)]

flag = []
key_len = len(key)

for i in range(len(encrypted_msg)):
    flag.append(encrypted_msg[i] ^ key[i % key_len])

flag = "".join(chr(o) for o in flag)


print(flag)