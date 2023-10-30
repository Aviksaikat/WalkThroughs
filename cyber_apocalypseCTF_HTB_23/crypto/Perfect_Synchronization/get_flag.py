import ast
from binascii import unhexlify
from collections import Counter

from pwn import *

context.log_level = 'error'

# with open("data.txt", 'r') as f:
#     hash_dict = ast.literal_eval(f.read())

# # now you can access the hash value for a character using the dictionary
# hash_value_for_A = hash_dict['A']

# print(xor(hash_dict['A'].encode(), hash_dict['B'].encode()).decode())

with open("crypto_perfect_synchronization/output.txt") as f:
    data = f.read().split()

print(Counter(data))

