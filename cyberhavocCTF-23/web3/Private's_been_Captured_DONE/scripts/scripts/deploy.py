#!/usr/bin/python3
from brownie import Fallback
from scripts.helpful_scripts import get_account


def deploy():
    owner, _ = get_account()
    fallback = Fallback.deploy({"from": owner})
    return fallback, owner


def main():
    deploy()

if __name__ == '__main__':
    main()