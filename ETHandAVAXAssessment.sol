// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AdvancedSmartContract {
    address public owner;
    mapping(address => uint256) public balances;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    function deposit(uint256 _amount) public {
        // Example of require statement
        require(_amount > 0, "Amount must be greater than zero");

        // Example of assert statement
        assert(balances[msg.sender] + _amount >= balances[msg.sender]);

        // Example of revert statement
        if (_amount == 42) {
            revert("Cannot deposit the special number 42");
        }

        balances[msg.sender] += _amount;
    }

    function withdraw(uint256 _amount) public onlyOwner {
        // Example of require statement
        require(_amount <= balances[msg.sender], "Insufficient balance");

        // Example of assert statement
        assert(balances[msg.sender] - _amount >= 0);

        balances[msg.sender] -= _amount;
    }
}
