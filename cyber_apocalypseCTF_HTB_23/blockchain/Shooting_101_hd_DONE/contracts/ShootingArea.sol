pragma solidity ^0.8.18;

contract ShootingArea {
    bool public firstShot;
    bool public secondShot;
    bool public thirdShot;

    modifier firstTarget() {
        require(!firstShot && !secondShot && !thirdShot);
        _;
    }

    modifier secondTarget() {
        require(firstShot && !secondShot && !thirdShot);
        _;
    }

    modifier thirdTarget() {
        require(firstShot && secondShot && !thirdShot);
        _;
    }

    // first the fallback() function will get called because it is defined with the fallback keyword and has no function name. The receive() function is defined with the receive keyword and is only called when the contract receives Ether with no data, so it won't get called if you send Ether with some data.

    receive() external payable secondTarget {
        secondShot = true;
    }

    fallback() external payable firstTarget {
        firstShot = true;
    }

    function third() public thirdTarget {
        thirdShot = true;
    }
}
