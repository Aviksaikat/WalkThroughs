#!/usr/bin/python3
from brownie import HighSecurityGate, Setup
from scripts.helpful_scripts import get_account


def deploy():
    owner, _ = get_account()
    st = Setup.deploy({"from": owner})
    hs = HighSecurityGate.deploy({"from": owner})
    return hs, st, owner


def main():
    deploy()

if __name__ == '__main__':
    main()