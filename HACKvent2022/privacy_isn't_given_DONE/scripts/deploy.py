#!/usr/bin/python3
from brownie import NotSoPrivate
from scripts.helpful_scripts import get_account


def deploy():
    owner, _ = get_account()

    NotSoPrivate = NotSoPrivate.deploy({"from": owner})

    print(f"Contract Deployed to {NotSoPrivate.address}")
    return NotSoPrivate, owner


def main():
    deploy()
