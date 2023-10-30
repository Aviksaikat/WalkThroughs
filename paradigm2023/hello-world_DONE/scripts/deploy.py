#!/usr/bin/python3
from ape import accounts, project


def deploy(unlocked_password=False):
    owner = accounts[0]
    attacker = accounts.load("hello-world")

    challenge = w.deploy(sender=owner)

    return challenge, attacker

def main():
    deploy("a")
