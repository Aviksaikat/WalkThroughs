// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";
import "lib/openzeppelin-contracts/contracts/access/Ownable.sol";

/// @title StakeKing
/// @author https://twitter.com/Sm4rty_
/// @notice StakeKing: Where Everyone's a Winner, Especially the Exploiter!
contract StakeKing is Ownable {
    IERC20 public token;
    uint256 public hourlyInterestRate;
    uint256 public feePercentage;
    address public feeManager;
    uint256 public totalStaked;

    mapping(address => uint256) public stakedBalances;
    mapping(address => uint256) public lastClaimedUserTimestamp;
    mapping(address => uint256) public stakedTimeInSeconds;

    event Staked(address indexed user, uint256 amount);
    event Redeemed(address indexed user, uint256 amount);
    event InterestClaimed(address indexed user, uint256 amount);

    constructor(address _tokenAddress, address _feeManagerAddress) {
        token = IERC20(_tokenAddress);
        hourlyInterestRate = 50;
        feePercentage = 20; // 20% fee
        feeManager = _feeManagerAddress;
    }

    // Stake tokens - Putting your money here is safer than banks
    function stake(uint256 amount) external {
        require(amount > 0, "Amount must be greater than 0");
        require(token.transferFrom(msg.sender, address(this), amount), "Transfer failed");

        accrueInterest(msg.sender);

        stakedBalances[msg.sender] += amount;
        totalStaked += amount;
        emit Staked(msg.sender, amount);
    }

    // Redeem staked tokens - Time to cash out
    function redeem(uint256 amount) external {
        require(amount > 0, "Amount must be greater than 0");
        require(stakedBalances[msg.sender] >= amount, "Insufficient staked balance");

        accrueInterest(msg.sender);

        stakedBalances[msg.sender] -= amount;
        totalStaked -= amount;

        require(token.transfer(msg.sender, amount), "Transfer failed");
        emit Redeemed(msg.sender, amount);
    }

    // Claim accrued interest - Show me the money!
    function claimInterest() external {
        uint256 accruedInterest = calculateAccruedInterest(msg.sender);
        require(accruedInterest > 0, "No accrued interest to claim");

        uint256 fee = (accruedInterest * feePercentage) / 100;
        uint256 remainingInterest = accruedInterest - fee;

        require(token.transfer(msg.sender, remainingInterest), "Transfer failed");

        // Send the fee to the fee manager address
        require(token.transfer(feeManager, fee), "Fee transfer failed");

        emit InterestClaimed(msg.sender, remainingInterest);
    }

    function getAccruedInterest(address user) external view returns (uint256) {
        return calculateAccruedInterest(user);
    }

    function calculateAccruedInterest(address user) internal view returns (uint256) {
        uint256 userBalance = stakedBalances[user];
        uint256 lastClaimedTime = lastClaimedUserTimestamp[user];

        if (lastClaimedTime == 0) {
            return 0;
        }

        uint256 currentTime = block.timestamp;
        uint256 timeSinceLastClaim = currentTime - lastClaimedTime;

        uint256 hourlyInterest = (userBalance * hourlyInterestRate) / 100;
        uint256 accruedInterest = (hourlyInterest * timeSinceLastClaim) / 3600; // 1 hour = 3600 seconds

        return accruedInterest;
    }

    function accrueInterest(address user) internal {
        if (lastClaimedUserTimestamp[user] == 0) {
            lastClaimedUserTimestamp[user] = block.timestamp;
        }

        uint256 timeSinceLastClaim = block.timestamp - lastClaimedUserTimestamp[user];

        if (timeSinceLastClaim > 0) {
            lastClaimedUserTimestamp[user] = block.timestamp;
            stakedTimeInSeconds[user] += timeSinceLastClaim;
        }
    }

    // SOME ADMIN FUNCTION
    function setHourlyInterestRate(uint256 _hourlyInterestRate) external onlyOwner {
        hourlyInterestRate = _hourlyInterestRate;
    }

    function setFeeManager(address _feeManagerAddress) external onlyOwner {
        feeManager = _feeManagerAddress;
    }

    function setFeePercentage(uint256 _feePercentage) external onlyOwner {
        feePercentage = _feePercentage;
    }

    function sweep(address tokenAddress) external onlyOwner {
        require(tokenAddress != address(token), "Cannot sweep staked token");
        IERC20 sweepToken = IERC20(tokenAddress);
        uint256 balance = sweepToken.balanceOf(address(this));
        require(sweepToken.transfer(msg.sender, balance), "Transfer failed");
    }
}
