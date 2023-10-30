#!/usr/bin/python3
from ape import project

from scripts.helper_functions import get_account


def deploy():
    owner, _ = get_account()

    name = "Jadu"
    vault = project.Vault.deploy(name.encode(), sender=owner)
    return vault


def main():
    deploy("a")
