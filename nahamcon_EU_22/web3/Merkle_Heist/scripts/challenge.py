from brownie import *
from brownie import convert


def restricted_accounts():
    return [accounts[9]]


def deploy():
    ADMIN = accounts[9]
    token = SimpleToken.deploy("Simple Token", "STK", {"from": ADMIN})
    _merkleRoot = 0x654EF3FA251B95A8730CE8E43F44D6A32C8F045371CE6A18792CA64F1E148F8C
    airdrop = Airdrop.deploy(token, 1e5, _merkleRoot, 4, {"from": ADMIN})
    token.setAirdropAddress(airdrop, {"from": ADMIN})

    merkleProof = [
        int(convert.to_bytes(accounts[9].address).hex(), 16),
        0x000000000000000000000000FEB7377168914E8771F320D573A94F80EF953782,
        0xB10E2D527612073B26EECDFD717E6A320CF44B4AFAC2B0732D9FCBE2B7FA0CF6,
        0x290DECD9548B62A8D60345A988386FC84BA6BC95484008F6362F93160EF3E563,
    ]

    # airdrop.mintToken(merkleProof)
    print(airdrop.merkleRoot())


def solved():
    token = SimpleToken[-1]

    # You should mint 100000 amount of token.
    if token.totalSupply() == 200000:
        return True, "Solved!"
    else:
        return False, "Not solved, you need to mint enough to solve."


CONFIG = {
    # "RPC": "https://ctf.nahamcon.com/challenge/41/da173c04-a8b3-4ac2-9dd4-e022fa82e4c9",
    # "BLOCK_NUMBER": '',
    # 'FLAGS': '',
    "MNEMONIC": "test test test test test test test test test test test junk",
    # 'RUNNABLES': [],
    # 'ALLOWED_RPC_METHODS': []
}
