// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.9;

contract CrackMe {
    uint a0;
    uint a1;

    mapping(uint=>uint) public c;

    constructor () {
        a0 = block.number;
        a1 = block.chainid;
    }

    function getValue(uint n) public view returns(uint) {
        return n + a0 * a1 * c[a0] * c[a1] * c[a0+a1] + c[a0/a1];
    }

    function setValue(uint offset, uint value) public {
        c[offset] = value;
    }
}
