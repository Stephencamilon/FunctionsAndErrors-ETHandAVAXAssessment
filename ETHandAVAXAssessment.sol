// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SmartContractWithLimit {
    address public contractOwner;
    mapping(address => uint256) public userBalances;
    uint256 public totalTokens;
    uint256 public maxDepositLimit = 9999;
    uint256 public maxWithdrawLimit = 5000;

    event DepositMade(address indexed account, uint256 amount);
    event WithdrawalMade(address indexed account, uint256 amount);

    constructor() {
        contractOwner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == contractOwner, "Only the owner can call this function");
        _;
    }

    function deposit(uint256 _amount) public {
        require(_amount > 0, "The amount must not be negative or zero");
        
        if (_amount > maxDepositLimit) {
            revert("Deposit amount exceeds maximum limit");
        }

        assert(totalTokens + _amount >= totalTokens);

        totalTokens += _amount;
        userBalances[msg.sender] += _amount;

        emit DepositMade(msg.sender, _amount);
    }

    function withdraw(uint256 _amount) public onlyOwner {
        require(_amount <= userBalances[msg.sender], "Insufficient balance");

        if (_amount > maxWithdrawLimit) {
            revert("Withdrawal amount exceeds maximum limit");
        }

        assert(userBalances[msg.sender] - _amount >= 0);

        userBalances[msg.sender] -= _amount;
        totalTokens -= _amount;

        emit WithdrawalMade(msg.sender, _amount);
    }

    function getBalance(address _account) public view returns (uint256) {
        return userBalances[_account];
    }
}
