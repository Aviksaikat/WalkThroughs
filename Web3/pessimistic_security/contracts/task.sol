// SPDX-License-Identifier: MIT
// This code snippet is provided by Pessimistic company.
// To apply for the internship opportunity at Pessimistic company,
// please fill out the form by visiting the following link: https://forms.gle/SUTcGi8X86yNoFnG7

// Caution: This code is intended for educational purposes only
// and should not be used in production environments.

pragma solidity ^0.8.17;

contract Storage {
    uint64 public constant SCALE = 1e18;

    function scale(uint64 a) external pure returns (uint256 result) {
        result = SCALE * a;
    }
}
