#!/usr/bin/python3
import subprocess
from termcolor import cprint

'''
please make sure the "random.dic" (wordlist) and the
"program" executable exists in the current directory
in order for psychoCracker.py to work without any errors. 
'''

try:
    with open('random.dic','r') as data:
        lines = data.read().splitlines()
        cprint("\n[*] Starting Disctionary Brute force\n\n","blue")
        for line in lines:
            cmd = "./program %s"%(line)
            test_com = subprocess.check_output(cmd, shell=True).decode("uft-8")

            if 'Incorrect' in test_com:
                print("[-] %s => Invalid"%(line))
            else:
                cprint("[+] %s => Valid\nExtracting Message ...\n"%(line),"green")
                print(test_com)
                break

except FileNotFoundError:
    cprint("\n[Error] 'random.dic' or the 'program' executable was not found in the current directory\nExiting ...\n","red")
except:
    print("Unknown Error")
