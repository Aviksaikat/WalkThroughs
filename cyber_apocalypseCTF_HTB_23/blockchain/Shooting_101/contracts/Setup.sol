pragma solidity ^0.8.18;

import {ShootingArea} from "./ShootingArea.sol";

/*
Private key     :  0x50b7dc1a61fd6da8cc1464edfad92b1a5310381d9ab2ec7d7b9b4eeba1896f94
Address         :  0xD68ec30ba05243257dE69C91a9ba0b595F6D7507
Target contract :  0xAdFE0b56f55C3dFA867f0Ff06cfea4C13Ee07c75
Setup contract  :  0xDC8400A31a469aFB853bfF604C945741670590C9
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
