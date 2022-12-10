pragma solidity ^0.8.10;
import "@openzeppelin/contracts/utils/Strings.sol";
import "hardhat/console.sol";

contract EtherStore {
    mapping(address => uint) public balances;
    string internal f4 = "11_ur_";
    string internal f8 = Strings.toString((((100 / 25) + 20 / 2) - 7) - 2);
    string internal f1 = "fl";
    string internal f6 = Strings.toString(((((100 / 25) + 20 / 2) - 7) - 2) + 2);
    string internal f10 = Strings.toString((100 / 10) / 10);
    string internal f11 = "n3}";
    string internal f5 = Strings.toString(((20 / 2) / 2) - 2);
    string internal f7 = "h_1";
    string internal f9 = "_m"; 
    string internal f2 = "a";
    string internal f3 = "g{4";

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function append(string memory a, string memory b, string memory c, string memory d, string memory e, string memory f, string memory g, string memory h, string memory i, string memory j, string memory k) internal pure returns (string memory) {
        return string(abi.encodePacked(a, b, c, d, e, f, g, h, i, j, k));

}

    function withdraw() public {
        uint bal = balances[msg.sender];
        require(bal > 0);

        (bool sent, ) = msg.sender.call{value: bal}("");
        require(sent, "Failed to send Ether");

        balances[msg.sender] = 0;
        console.log(append(f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11));
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
