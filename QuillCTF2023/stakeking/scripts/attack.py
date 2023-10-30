#!/usr/bin/python3
from ape import Contract, accounts, convert, networks, project

from scripts.deploy import deploy
from scripts.helper_functions import get_account

# from hexbytes import Hexbytes

def setup():
    usdc, fee_maganerm, stake_king = deploy()
    owner, alice, hacker = get_account()
    
    # initial Mint
    usdc.mint(alice.address, 100, sender=owner)
    usdc.mint(attakcer.address, 100, sender=owner)

    usdc.mint(alice.address, 1000, sender=owner)

    usdc.approve(stake_king.address, 2**256 -1, sender=alice)
    stake_king.stake(100, sender=alice)

    assert stake_king.stakedBalances(alice.address, 100)

    return usdc, fee_maganerm, stake_king, owner, alice, attacker
    

def attack():
    usdc, fee_maganerm, stake_king, owner, alice, attacker = setup()
    


def main():
    attack()


if __name__ == "__main__":
    main()
