import string
from os import urandom

from Crypto.Cipher import AES

#from secret import MESSAGE

MESSAGE = string.ascii_uppercase + ' ' + '{' + '_' + '}'

assert all([x.isupper() or x in '{_} ' for x in MESSAGE])


#print(MESSAGE)

class Cipher:

    def __init__(self):
        self.salt = urandom(15)
        key = urandom(16)
        self.cipher = AES.new(key, AES.MODE_ECB)

    def encrypt(self, message):
        return [self.cipher.encrypt(c.encode() + self.salt) for c in message]


def main():
    cipher = Cipher()
    encrypted = cipher.encrypt(MESSAGE)
    #print(encrypted)

    # create a dictionary mapping each character to its hash value
    hash_dict = {}
    for i in range(len(MESSAGE)):
        c = MESSAGE[i]
        h = encrypted[i].hex()
        hash_dict[c] = h

    # write the dictionary to file

    with open("../data.txt", 'w+') as f:
        f.write(str(hash_dict))



if __name__ == "__main__":
    main()
