import web3

RPC = "http://challs.htsp.ro:9001/72557b61-37c3-47d3-93da-5f041f4641d6"
ADDR = "0x966518D2f3413F805ae88Fa573A5D3a905A3a9F0"
ABI = [
    {
        "inputs": [],
        "name": "current_timestamp",
        "outputs": [{"internalType": "uint256", "name": "", "type": "uint256"}],
        "stateMutability": "view",
        "type": "function",
    },
    {
        "inputs": [{"internalType": "uint256", "name": "_guess", "type": "uint256"}],
        "name": "solve",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function",
    },
    {
        "inputs": [],
        "name": "solved",
        "outputs": [{"internalType": "bool", "name": "", "type": "bool"}],
        "stateMutability": "view",
        "type": "function",
    },
]


def main():
    w3 = web3.Web3(web3.HTTPProvider(RPC))
    # private_key = os.getenv("PRIVATE_KEY")

    blocker_contract = w3.eth.contract(address=ADDR, abi=ABI)
    blocker_contract.functions.solved().call()

    # print(dir(blocker_contract.functions.solved().call()))


if __name__ == "__main__":
    main()
