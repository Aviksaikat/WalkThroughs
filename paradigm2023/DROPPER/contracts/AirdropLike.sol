// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;


contract AirdropLike {
    function airdropETH(address[] calldata, uint256[] calldata) external payable {
        revert();
    }

    function airdropERC20(address, address[] calldata, uint256[] calldata, uint256) external {
        revert();
    }

    function airdropERC721(address, address[] calldata, uint256[] calldata) external {
        revert();
    }
}