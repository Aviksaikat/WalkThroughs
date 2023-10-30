#!/usr/bin/python3
from ape import project

from scripts.helper_functions import get_account


def deploy():
    owner, _ = get_account()

    vault = project.HexHunt.deploy(sender=owner)
    return vault


def main():
    deploy("a")
