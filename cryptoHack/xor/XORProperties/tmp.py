#!/usr/bin/env/python3

from pwn import xor

"""
pwnlib.util.fiddling.xor(*args, cut = 'max') → str[source]
Flattens its arguments using pwnlib.util.packing.flat() and then xors them together. If the end of a string is reached, it wraps around in the string.

Parameters:	
args – The arguments to be xor’ed together.
cut – How long a string should be returned. Can be either ‘min’/’max’/’left’/’right’ or a number.
Returns:	
The string of the arguments xor’ed together.

Example

>>> xor(b'lol', b'hello', 42)
b'. ***'

"""

# formula to get the flag FLAG ^ (KEY1 ^ (KEY3 ^ KEY2))

"""
KEY1 = "a6c8b6733c9b22de7bc0253266a3867df55acde8635e19c73313"
KEY2 ^ KEY1 = 37dcb292030faa90d07eec17e3b1c6d8daf94c35d4c9191a5e1e
KEY2 ^ KEY3 = c1545756687e7573db23aa1c3452a098b71a7fbf0fddddde5fc1
FLAG ^ KEY1 ^ KEY3 ^ KEY2 = 04ee9855208a2cd59091d04767ae47963170d1660df7f56f5faf
"""
key1 = "a6c8b6733c9b22de7bc0253266a3867df55acde8635e19c73313"
key2_key1 = "37dcb292030faa90d07eec17e3b1c6d8daf94c35d4c9191a5e1e"
key2_key3 = "c1545756687e7573db23aa1c3452a098b71a7fbf0fddddde5fc1"
FLAG_key1_key3_key2 = "04ee9855208a2cd59091d04767ae47963170d1660df7f56f5faf"

k1_ord = [i for i in bytes.fromhex(key1)]

k2_k3_ord = [i for i in bytes.fromhex(key2_key3)]

flag_k1_k3_k2_ord = [i for i in bytes.fromhex(FLAG_key1_key3_key2)]

#Self-Inverse: A ⊕ A = 0 
flag_k1_ord = [
    o_f132 ^ o23 for (o_f132, o23) in zip(flag_k1_k3_k2_ord, k2_k3_ord)
]

flag_ord = [o_f1 ^ o1 for (o_f1, o1) in zip(flag_k1_ord, k1_ord)]

flag = "".join(chr(i) for i in flag_ord)

print(flag)