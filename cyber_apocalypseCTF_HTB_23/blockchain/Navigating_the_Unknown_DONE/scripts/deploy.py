#!/usr/bin/python3
from brownie import Unknown, Setup
from scripts.helpful_scripts import get_account


def deploy():
    owner, _ = get_account()
    st = Setup.deploy({"from": owner})
    un = Unknown.deploy({"from": owner})
    return un, st, owner


def main():
    deploy()

if __name__ == '__main__':
    main()