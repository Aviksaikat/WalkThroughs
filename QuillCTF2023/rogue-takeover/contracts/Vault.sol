pragma solidity =0.8.13;

contract Vault {
    address public owner;
    bytes32 public immutable name;
    constructor (bytes32 _name) {
        owner = msg.sender;
        name = _name;
    }

    function anyCall(uint _func, uint data) external {
        <
        assembly {
            func := _func
        }
        func(data);
    }

    function transferOwnership() public {
        require(msg.sender == owner);
        owner = msg.sender;
    }
}