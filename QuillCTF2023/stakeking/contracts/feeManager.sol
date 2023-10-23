// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

contract FeeManager {
    address public owner;

    constructor() {
        owner = msg.sender; // Of course, I'm the boss here!
    }

    function transferOwnership(address newAddress) public {
        require(msg.sender == owner);
        require(newAddress != address(0), "New owner cannot be zero address"); // Duh, we need a real address
        owner = newAddress;
    }

    // Withdraw a single token from the contract
    function withdraw(address _tokenAddress, uint256 _amount) external {
        require(msg.sender == owner);
        require(_amount > 0, "Amount must be greater than 0"); // Can't withdraw thin air
        require(IERC20(_tokenAddress).transfer(owner, _amount), "Transfer failed");
    }

    // Withdraw multiple tokens from the contract
    function withdrawMultiple(address[] calldata _tokenAddresses, uint256[] calldata _amounts) external {
        require(msg.sender == owner);
        require(_tokenAddresses.length == _amounts.length, "Arrays length mismatch"); // Lists should match, obviously

        for (uint256 i = 0; i < _tokenAddresses.length; i++) {
            address tokenAddress = _tokenAddresses[i];
            uint256 amount = _amounts[i];

            require(amount > 0, "Amount must be greater than 0");
            require(IERC20(tokenAddress).transfer(owner, amount), "Transfer failed");
        }
    }

    function sendMsg(address token, bytes calldata data) external payable {
        (bool success,) = token.call(data); // Sending mysterious messages
        require(success);
    }
}
