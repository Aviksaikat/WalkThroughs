#!/usr/bin/python3
from brownie import Secret
from scripts.helpful_scripts import get_account


def deploy():
    owner, _ = get_account()
    s = Secret.deploy({"from": owner})
    return s, owner


def main():
    deploy()

if __name__ == '__main__':
    main()