// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract BankPairERC20 is ERC20 {

    address public owner;
    ERC20 public underlying;

    constructor(ERC20 _underlying, uint256 amount) ERC20("", "BKP") {
        owner = msg.sender;
        underlying = _underlying;
    }

    function mint(address to, uint256 amount) external {
        require(msg.sender == owner, "BankPairERC20: Only the owner can mint.");
        _mint(to, amount);
    }

    function burn(address from, uint256 amount) external {
        require(msg.sender == owner, "BankPairERC20: Only the owner can burn.");
        _burn(from, amount);
    }
}