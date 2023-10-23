#!/usr/bin/python3
from ape import project
from scripts.helper_functions import get_account


def deploy():
    owner, _ = get_account()

    usdc = project.erc20Token.deploy("USD Coin", "USDC", 0, sender=owner)
    fee_maganer = project.FeeManager.deploy(sender=owner)
    stake_king = project.StakeKing.deploy(
        usdc.address, fee_maganer.address, sender=owner
    )
    return usdc, fee_maganerm, stake_king


def main():
    deploy("a")
