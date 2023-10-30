#!/usr/bin/python3
import base64
import random
import string
from hashlib import sha256

from Crypto.Cipher import AES
from Crypto.Util.Padding import unpad

ALPHABET = string.ascii_letters + string.digits + '~!@#$%^&*'


encrypted_flag = base64.b64decode("tnP+MdNjHF1aMJVV/ciAYqQutsU8LyxVkJtVEf0J0T5j8Eu68AxcsKwd0NjY9CE+Be9e9FwSVF2xbK1GP53WSAaJuQaX/NC02D+v7S/yizQ=")

password = "gBv#3%DXMV*7oCN2M71Zfe0QY^dS3ji7DgHxx2bNRCSoRPlVRRX*bwLO5eM&0AIOa&#$@u"

# Initialize an empty MASTER_KEY
MASTER_KEY = 0
"""
Reverse the Password: The script reverses the given password. Reversing the password allows us to process it from the end to the beginning, as the password generation in the original script is bit-wise and starts from the least significant bit (LSB)
"""
# Reverse the password to align with bit positions
reversed_password = password[::-1]

for char in reversed_password:
    # Determine whether the character was selected from the first or second half of ALPHABET
    if char in ALPHABET[:len(ALPHABET)//2]:
        bit = 1
    else:
        bit = 0

    # Shift MASTER_KEY and add the recovered bit
    MASTER_KEY = (MASTER_KEY << 1) | bit
"""
(MASTER_KEY.bit_length() + 7) // 8: This expression calculates the number of bytes needed to represent the integer MASTER_KEY. Here's how it works:

MASTER_KEY.bit_length(): This part of the expression determines the number of bits needed to represent the integer MASTER_KEY. For example, if MASTER_KEY is 8, it would require 4 bits.

Adding 7: This is done to ensure that there's enough room for any additional padding bits in case the bit length is not a multiple of 8. Adding 7 effectively rounds up to the nearest multiple of 8. For example, if the bit length is 4, adding 7 results in 11, which is the bit length rounded up to the nearest multiple of 8.

Dividing by 8: Finally, the result is divided by 8 to convert the bit length to the number of bytes needed. This ensures that the bytes object will have sufficient space to store the integer.
"""
# Convert the integer MASTER_KEY to bytes
MASTER_KEY_bytes = MASTER_KEY.to_bytes((MASTER_KEY.bit_length() + 7) // 8, 'little')

#print(f"Recovered MASTER_KEY: {MASTER_KEY_bytes}")

# Decrypt the flag
encryption_key = sha256(MASTER_KEY_bytes).digest()
cipher = AES.new(encryption_key, AES.MODE_ECB)
flag = unpad(cipher.decrypt(encrypted_flag), AES.block_size)
print(flag.decode())