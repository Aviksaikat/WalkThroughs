#!/usr/bin/python3
from brownie import PermissionDenied
from scripts.helpful_scripts import get_account


def deploy():
    owner, _ = get_account()
    pd = PermissionDenied.deploy("CHCTF{hahaha_FAKE_FLAG}", {"from": owner})
    return pd, owner


def main():
    deploy()

if __name__ == '__main__':
    main()