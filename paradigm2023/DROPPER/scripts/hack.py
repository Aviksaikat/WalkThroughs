#!/usr/bin/python3
from ape import accounts, project

"""
rpc endpoints:
    - http://dropper.challenges.paradigm.xyz:8545/4bd6a43f-8aaa-43a0-bbba-948505c6f69c/main
private key:        0xbbc4961d2a456ba483a49e92fc80bb5f882ab30495cc6dbd44a6f2b50411fb6d
challenge contract: 0xc427D0A35B73452e5aFB6f736cde742C796D15da
"""

ADDRESS = "0xc427D0A35B73452e5aFB6f736cde742C796D15da"


def main():
    attacker = accounts.load("dropper")
    attacker.set_autosign(True, passphrase="a")
    challenge = project.Challenge.at(ADDRESS)

    airdrop_contract = project.AirdropLike.deploy(sender=attacker)

    challenge.submit(airdrop_contract, sender=attacker)
