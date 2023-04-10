#!/usr/bin/python3
from brownie import Factory
from scripts.helpful_scripts import get_account


def deploy():
    owner, _ = get_account()
    factory = Factory.deploy({"from": owner, "value": "1 ether"})

    print(f"Contract Deployed to: {factory.address}")
    return factory, owner


def main():
    deploy()