#!/usr/bin/python3
from brownie import Blocker

from scripts.helpful_scripts import get_account


def deploy():
    owner, _ = get_account()

    blocker = Blocker.deploy({"from": owner})

    print(f"Contract Deployed to {blocker.address}")
    return blocker, owner


def main():
    deploy()
