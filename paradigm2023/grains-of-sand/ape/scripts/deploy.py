#!/usr/bin/python3
from ape import project
from scripts.helper_functions import get_account


def deploy(unlocked_password=False):
    owner, _ = get_account(unlock_password=unlocked_password)

    # delegate = owner.deploy(project.Delegate, owner.address)
    delegate = project.Delegate.deploy(owner.address, sender=owner)
    delegation = project.Delegation.deploy(delegate.address, sender=owner)

    # print("Contract deployed to: ", fb.address)
    return delegate, delegation


def main():
    deploy("a")
