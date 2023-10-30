from ape import Contract, accounts, networks, project

"""
rpc endpoints:
        - http://grains-of-sand.challenges.paradigm.xyz:8545/a4fe03b1-3c1b-4d0c-b979-93c3f30697d2/main
private key:        0x598032838876c5c60a57db234d67e0ba1e1358bfc150f7714beb90b7ca5e10f3
challenge contract: 0x4c6d77a4107E86d97D9d7e8A816300A3cF240Cd5
"""

def main():
    attacker = accounts[2]

    contract = project.Challenge.at("0x4c6d77a4107E86d97D9d7e8A816300A3cF240Cd5")

    print(networks.provider.get_storage_at(contract.address, 1))

    print(dir(Contract("0xC937f5027D47250Fa2Df8CbF21F6F88E98817845")))