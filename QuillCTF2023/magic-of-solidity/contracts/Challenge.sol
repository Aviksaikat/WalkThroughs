// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.9;

/**
 *                                                          
 *               ,          /)           /) ,   /) ,       
 *   ___   _   _      _    ___//    _   ___//    _(/   _/_    
 *   // (_(_(_(_/__(_(__  (_)/(_   /_)_(_)(/__(_(_(__(_(__(_/_
 *           .-/            /)                           .-/  
 *       (_/            (/                           (_/   
 *
 * @author jinu.eth < https://twitter.com/lj1nu >
 */

import {CrackMe} from "./CrackMe.sol";

contract Challenge {
    bool public isSolved;

    constructor () {
        isSolved = false;
    }

    function solve() public { 
        bytes32 salt = keccak256(abi.encodePacked(block.number));
        uint gasInput = gasleft() / 1500;

        uint sum = 1;
        
        for(uint i=1;i<=11;i++){
            salt = keccak256(abi.encodePacked(salt, sum));
            CrackMe answ = new CrackMe{salt: salt}();
            try answ.getValue{gas: gasInput}( i ) returns(uint256 value) {
                sum *= (sum + value);
            } catch (bytes memory) {
            } 
        }

        require(sum == 0x997fecf7193572c88c27ea9af4653249258);
        
        isSolved = true;
    }
}
