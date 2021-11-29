#!/bin/python3
from base64 import b64encode
import jwt
from urllib.parse import quote
import ast
import argparse

def jwt_encode(data):
    return quote(b64encode(data))

def jwt_none(data):
    header  = """{"typ":"JWT","alg":"none"}""".encode('ascii')
    payload = f"""{data}""".encode('ascii')
    payload = jwt_encode(header) + '.' + jwt_encode(payload) + '.'
    return payload

def jwt_secret(data, secret, algo):
    payload = ast.literal_eval(data) 
    encoded_jwt = jwt.encode(payload, secret, algorithm=algo) 
    return encoded_jwt.decode('utf-8')



def main():
    if algo == "none":
        output = jwt_none(data)
        print(output)
    if algo != "none":
        try:
            output = jwt_secret(data, secret, algo)
            print(output)
        except:
            parser.print_help()
            print("\n[-] Error in data passed. Must be a dict")
            exit()

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("-d", "--data", help="Specify JWT data as a dictenry")
    parser.add_argument("-a", "--algo", help="Specify JWT encryption algorithm (default: None)")
    parser.add_argument("-s", "--secret", help=" Specify JWT secret for encryption")
    parser.add_argument("-k", "--key_file", help="Specify JWT key file for encryption")
    args = parser.parse_args()
    
    if not args.data:
        parser.print_help()
        print("\n[-] Please specify a data to encrypt.")
        exit()
    
    data = args.data
    
    if not args.algo:
        algo = "none"
    else:
        algo = args.algo

    if not (args.secret or args.key_file):
        parser.print_help()
        print("\n[-] Please specify a secret or key file.")
        exit()
    else:
        if not args.algo:
            parser.print_help()
            print("\n[-] Please specify an algorithem.")
            exit()
   
    if args.secret and args.key_file:
        parser.print_help()
        print("\n[-] Please specify a secret or key file not both!.")
        exit()
    if args.secret:
        secret = args.secret
    else:
        secret = open(args.key_file, 'r').read()

    main()
