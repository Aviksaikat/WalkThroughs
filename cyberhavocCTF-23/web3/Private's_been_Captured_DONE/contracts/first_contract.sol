// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Secret{
    string public Name = "ALICE";
    uint public Age= 24;
    string public Address = "Metaverse";
		string public Email = "alice@email.com";
    string private secret_flag; //Super Secret Key
		uint public Phone = 1337013370;
    address public Wallet = 0x567D5c6c1e8048477F365dD0ac6a1650daDD5e65;
}
