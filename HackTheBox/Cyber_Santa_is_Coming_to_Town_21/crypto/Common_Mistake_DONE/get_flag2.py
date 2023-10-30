#!/usr/bin/python3
#? RSA Common modulus attack
import argparse
import math
from binascii import unhexlify


def egcd(a, b):
    if a == 0:
        return b, 0, 1
    else:
        g, y, x = egcd(b % a, a)
        return g, x - (b // a) * y, y


def modinv(a, m):
    return pow(a, -1, m)


def attack(c1, c2, e1, e2, N):
    if math.gcd(e1, e2) != 1:
        raise ValueError("Exponents e1 and e2 must be coprime")
    s1 = modinv(e1, e2)
    s2 = (math.gcd(e1, e2) - e1 * s1) // e2
    temp = modinv(c2, N)
    m1 = pow(c1, s1, N)
    m2 = pow(temp, -s2, N)
    return (m1 * m2) % N


def main():
    #args = parser.parse_args()
    print('[+] Started attack...')
    try:
        message = attack(ct1, ct2, e1, e2, modulus)
        #message = attack(args.ct1, args.ct2, args.e1, args.e2, args.modulus)
        print('[+] Attack finished!')
        # print('\nPlaintext message:\n%s' % format(unhexlify(message), 'x'))
        print(unhexlify(hex(message)[2:]))
    except Exception as e:
        print('[+] Attack failed!')
        print(e)


if __name__ == "__main__":
    # parser = argparse.ArgumentParser(description='RSA Common modulus attack')
    # required_named = parser.add_argument_group('required named arguments')
    # required_named.add_argument('-n', '--modulus', help='Common modulus', type=int, required=True)
    # required_named.add_argument('-e1', '--e1', help='First exponent', type=int, required=True)
    # required_named.add_argument('-e2', '--e2', help='Second exponent', type=int, required=True)
    # required_named.add_argument('-ct1', '--ct1', help='First ciphertext', type=int, required=True)
    # required_named.add_argument('-ct2', '--ct2', help='Second ciphertext', type=int, required=True)
    modulus = 0xa96e6f96f6aedd5f9f6a169229f11b6fab589bf6361c5268f8217b7fad96708cfbee7857573ac606d7569b44b02afcfcfdd93c21838af933366de22a6116a2a3dee1c0015457c4935991d97014804d3d3e0d2be03ad42f675f20f41ea2afbb70c0e2a79b49789131c2f28fe8214b4506db353a9a8093dc7779ec847c2bea690e653d388e2faff459e24738cd3659d9ede795e0d1f8821fd5b49224cb47ae66f9ae3c58fa66db5ea9f73d7b741939048a242e91224f98daf0641e8a8ff19b58fb8c49b1a5abb059f44249dfd611515115a144cc7c2ca29357af46a9dc1800ae9330778ff1b7a8e45321147453cf17ef3a2111ad33bfeba2b62a047fa6a7af0eef #n

    e1 = 0x10001
    e2 = 0x23

    ct1 = 0x55cfe232610aa54dffcfb346117f0a38c77a33a2c67addf7a0368c93ec5c3e1baec9d3fe35a123960edc2cbdc238f332507b044d5dee1110f49311efc55a2efd3cf041bfb27130c2266e8dc61e5b99f275665823f584bc6139be4c153cdcf153bf4247fb3f57283a53e8733f982d790a74e99a5b10429012bc865296f0d4f408f65ee02cf41879543460ffc79e84615cc2515ce9ba20fe5992b427e0bbec6681911a9e6c6bbc3ca36c9eb8923ef333fb7e02e82c7bfb65b80710d78372a55432a1442d75cad5b562209bed4f85245f0157a09ce10718bbcef2b294dffb3f00a5a804ed7ba4fb680eea86e366e4f0b0a6d804e61a3b9d57afb92ecb147a769874

    ct2 = 0x79834ce329453d3c4af06789e9dd654e43c16a85d8ba0dfa443aefe1ab4912a12a43b44f58f0b617662a459915e0c92a2429868a6b1d7aaaba500254c7eceba0a2df7144863f1889fab44122c9f355b74e3f357d17f0e693f261c0b9cefd07ca3d1b36563a8a8c985e211f9954ce07d4f75db40ce96feb6c91211a9ff9c0a21cad6c5090acf48bfd88042ad3c243850ad3afd6c33dd343c793c0fa2f98b4eabea399409c1966013a884368fc92310ebcb3be81d3702b936e7e883eeb94c2ebb0f9e5e6d3978c1f1f9c5a10e23a9d3252daac87f9bb748c961d3d361cc7dacb9da38ab8f2a1595d7a2eba5dce5abee659ad91a15b553d6e32d8118d1123859208

    main()