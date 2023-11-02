#!/usr/bin/python3
from brownie import Setup, ShootingArea
from scripts.helpful_scripts import get_account


def deploy():
    owner, _ = get_account()
    stp = Setup.deploy({"from": owner})
    sa = ShootingArea.deploy({"from": owner})
    return stp, sa, owner


def main():
    deploy()

if __name__ == '__main__':
    main()