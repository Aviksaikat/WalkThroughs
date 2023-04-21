// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PermissionDenied {
    string private data; 
    address owner;

    constructor(string memory _data) {
        data = _data;
        owner = msg.sender;
    }

    function isContract(address addr) public view returns (bool) {
        uint size;
        assembly {
            size := extcodesize(addr)
            }
        return size > 0;
    }

    function changeOwner() external {
        require (msg.sender != tx.origin, "No-EOA allowed!");
        require (!isContract(msg.sender), "No-contract allowed either!");
        owner = msg.sender;
    }
    
    function getflag() public view returns (string memory) {
        require(msg.sender == owner, "You are not owner yet!");
        return(data);
    }
}