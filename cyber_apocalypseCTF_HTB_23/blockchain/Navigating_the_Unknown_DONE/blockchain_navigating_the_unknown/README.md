## Guidelines

The point of this README is to provide some guidance for people who attempt solving a blockchain challenge for the first time.

### Ports

As you have already seen, there are 2 ports provided.

- The one port is the `tcp` port, which is used to retrieve information about connecting to the private chain, such as private key, and the target contract's addresses. You can connect to this one using `netcat`.
- The other port is the `rpc` url. You will need this in order to connect to the private chain.

In order to figure out which one is which, try using `netcat` against both. The one which works is the `tcp` port, while the other one is the `rpc url`.

### Contract Sources

In these challenges, you will meet 2 type of smart contract source files, the `Setup.sol` file and the challenge files.

#### Setup.sol

The `Setup.sol` file contains a single contract, the `Setup`. As the name indicates, inside this contract all the initialization actions are happening. There will typically be 3 functions:

- `constructor()`: It is called automatically once when the contract is deployed and cannot be called again. It contains all the initialization actions of the challenge, like deploying the challenge contracts and any other actions needed.
- `TARGET()`: It returns the address of the challenge contract.
- `isSolved()`: This function contains the final objective of the challenge. It returns `true` if the challenge is solved, `false` otherwise. By reading its source, one is able to figure out what the objective is.

#### Other source files

All the other files provided are the challenge contracts. You will only have to interact with them to solve the challenge. Try analyzing their source carefully and figure out how to break them, following the objective specified in `isSolved` function of the `Setup` contract.

### Interacting with the blockchain

In order to interact wth the smart contracts in the private chain, you will need:

- A private key with some ether. We provide it via the tcp endpoint.
- The target contract's address. We provide both the Setup's and the Target's addresses.
- The rpc url, which can be found using what described earlier.

After having collected all the connection information, then you can either use `web3py` or `web3js` to perform function calls in the smart contracts or any other actions needed. You can find some useful tutorials about both with a little googlin'.
An even handier way is using a tool like `foundry-rs`, which is an easy-to-use cli utility to interact with the blockchain, but there are less examples online than the other alternatives.
