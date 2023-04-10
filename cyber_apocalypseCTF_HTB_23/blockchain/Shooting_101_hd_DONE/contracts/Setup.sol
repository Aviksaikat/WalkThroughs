pragma solidity ^0.8.18;

import {ShootingArea} from "./ShootingArea.sol";

/*
Private key     :  0xaf1052df9c80ac645acf7333044ab923ca8c3fed3dc77246e5f774ef57cb3204
Address         :  0x048b881b66b77a86054543F158dC7dAC10cD3A6c
Target contract :  0x0d65679f97Fc605b17cC57B3B7e6A0F688C8851c
Setup contract  :  0xDBB3232ff3FcB348c9311Aa9D58fFaB9cDf0aB2f

*/

contract Setup {
    ShootingArea public immutable TARGET;

    constructor() {
        TARGET = new ShootingArea();
    }

    function isSolved() public view returns (bool) {
        return TARGET.firstShot() && TARGET.secondShot() && TARGET.thirdShot();
    }
}
