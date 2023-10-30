#!/usr/bin/env python2

import pyfiglet
from cryptography.fernet import Fernet

key = input("Enter the key:  ")

f = Fernet(key)

encrypted_mess = 'gAAAAABfdb52eejIlEaE9ttPY8ckMMfHTIw5lamAWMy8yEdGPhnm9_H_yQikhR-bPy09-NVQn8lF_PDXyTo-T7CpmrFfoVRWzlm0OffAsUM7KIO_xbIQkQojwf_unpPAAKyJQDHNvQaJ'
dcrypt_mess = f.decrypt(encrypted_mess)
mess = dcrypt_mess.decode()

display1 = pyfiglet.figlet_format("You Are Now The Owner Of ")
display2 = pyfiglet.figlet_format("Chocolate Factory ")

print(display1)
print(display2)
print(mess)