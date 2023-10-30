#!/usr/bin/python3
from brownie import accounts, config, network
from web3 import Web3 as w3

FORKED_LOCAL_ENVIRONMENTS = ["mainnet-fork", "mainnet-fork-dev"]
LOCAL_BLOCKCHAIN_ENVIRONMENTS = [
    "development",
    "ganache-local",
    "ganache-local-new-chainId",
]


def convert(value):
    return w3.fromWei(value, "ether")


def get_account():
    if (
        network.show_active() in LOCAL_BLOCKCHAIN_ENVIRONMENTS
        or network.show_active() in FORKED_LOCAL_ENVIRONMENTS
    ):
        return accounts[0], accounts[1]

    if network.show_active() in config["networks"]:
        return accounts.add(config["wallets"]["from_key"])

    return None
