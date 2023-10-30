from ape import accounts, networks

# All local chains across "ecosystems" have the same name
LOCAL_CHAIN_NAMES = ["local", "development"]
FORKED_CHAIN_NAMES = ["mainnet-fork", "sepolia-fork"]


def get_account(index=None, id=None, unlock_password=None):
    if index:
        return accounts[index]
    if id:
        account_to_use = accounts.load(id)
        if unlock_password:
            account_to_use.set_autosign(True, passphrase=unlock_password)
        return account_to_use
    if (networks.active_provider.network.name in LOCAL_CHAIN_NAMES) or (
        networks.active_provider.network.name in FORKED_CHAIN_NAMES
    ):
        return accounts.test_accounts[0], accounts.test_accounts[1]
    if (
        networks.active_provider.chain_id == 31337
        or networks.active_provider.chain_id == 1337
    ):
        account_to_use = accounts.load("ctf")
        if unlock_password:
            account_to_use.set_autosign(True, passphrase=unlock_password)
        return account_to_use

    # If none of the above...
    account_to_use = accounts.load("ctf")
    if unlock_password:
        account_to_use.set_autosign(True, passphrase=unlock_password)
    return account_to_use


def main():
    pass
