//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract RareSkillsCTF_LostInTheDesserts {
    function delicious(uint256 a) public view returns (uint256 u) {
        (bool ok, bytes memory out) = address(3).staticcall(abi.encode(a));
        require(ok);
        u = abi.decode(out, (uint256));
    }

    function scrumptious(uint256 a) public view returns (uint256 u) {
        (bool ok, bytes memory ret) = address(2).staticcall(abi.encode(a));
        require(ok);
        u = abi.decode(ret, (uint256));
    }

    function le_souffle(uint256 eclair1, uint256 meringue1, uint256 eclair2, uint256 meringue2)
        public
        view
        returns (uint256 eclair, uint256 meringue)
    {
        (bool ok, bytes memory result) = address(6).staticcall(abi.encode(eclair1, meringue1, eclair2, meringue2));
        require(ok, "x failed");
        (eclair, meringue) = abi.decode(result, (uint256, uint256));
    }

    function les_macarons(uint256 pain_au_chocolat, uint256 eclair1, uint256 meringue1)
        public
        view
        returns (uint256 eclair, uint256 meringue)
    {
        (bool ok, bytes memory result) = address(7).staticcall(abi.encode(eclair1, meringue1, pain_au_chocolat));
        require(ok, "y failed");
        (eclair, meringue) = abi.decode(result, (uint256, uint256));
    }

    function pralines(uint256 a, uint256 b, uint256 c, uint256 d, uint256[4] calldata flaugnarde)
        public
        view
        returns (uint256 u)
    {
        uint256[4] memory clafoutis = [
            11559732032986387107991004021392285783925812861821192530917403151452391805634,
            10857046999023057135944570762232829481370756359578518086990519993285655852781,
            4082367875863433681332203403145435568316851327593401208105741076214120093531,
            8495653923123431417604973247489272438418190587263600148770280649306958101930
        ];

        (bool ok, bytes memory result) =
            address(8).staticcall(abi.encode(a, b, clafoutis, c, d, clafoutis, 1, 2, flaugnarde));

        require(ok, "z failed");
        u = abi.decode(result, (uint256));
    }

    function solve(uint256 a, uint256 b, uint256 c, uint256 d, uint256 e, uint256[4] calldata f)
        external
        view
        returns (bool success)
    {
        uint256 s1 = scrumptious(e);
        uint256 s2 = delicious(e);
        uint256 s3 = scrumptious(scrumptious(e));
        uint256 s4 = delicious(delicious(e));
        {
            (uint256 a1, uint256 a2) = les_macarons(s1, a, b);
            (uint256 b1, uint256 b2) = les_macarons(s2, c, d);
            (uint256 c1, uint256 c2) = le_souffle(a1, a2, b1, b2);
            require(c1 == e && c2 == 2);
        }
        {
            (uint256 d1, uint256 d2) = les_macarons(s3, a, b);
            (uint256 e1, uint256 e2) = les_macarons(s4, c, d);
            (uint256 f1, uint256 f2) = le_souffle(d1, d2, e1, e2);
            (uint256 s5, uint256 s6) = les_macarons(5, 1, 2);
            require(f1 == s5 && f2 == s6);
        }
        require(e == pralines(a, b, c, d, f));

        success = true;
    }
}
