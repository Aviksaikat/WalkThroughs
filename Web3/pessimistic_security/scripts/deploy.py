from ape import project, accounts  # type: ignore


def deploy2() -> project.Wallet:
    owner = accounts.test_accounts[0]
    wallet = project.Wallet.deploy(sender=owner)

    return wallet


def deploy3() -> project.Vault:
    owner = accounts.test_accounts[0]
    vault = project.Vault.deploy("super-password".encode(), sender=owner)

    return vault


def main():
    pass
