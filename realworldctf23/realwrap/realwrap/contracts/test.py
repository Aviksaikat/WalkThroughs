from brownie import Factory
from scripts.deploy import deploy


def attack(contract_address=None, attacker=None):
    if not contract_address:
        factory, _ = deploy()
        contract_address = factory.address
        _, attacker = get_account()
    else:
        factory = Factory.at(contract_address)

    print(factory.address)


def main(contract_address=None, attacker=None):
    if contract_address:
        attack(contract_address, get_account())
    else:
        attack()


if __name__ == "__main__":
    main()

#contract = Factory.at("0x82be68643Aaab66614377499d0854bf686AE7d2D")