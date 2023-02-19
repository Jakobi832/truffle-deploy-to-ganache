// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Demo {
    address public owner;
    mapping (address => uint) public donutBalances; // 0 -> 4,000,000 uint256 size

    constructor() {
        owner = msg.sender;
        donutBalances[address(this)] = 100;
    }

    function getVMBalance() public view returns (uint) {
        return donutBalances[address(this)];
    }

    function restock(uint amount) public { //implied public
        require(msg.sender == owner, "Only the owner can restock the machine");
        donutBalances[address(this)] += amount;
    }

    function purchase(uint amount) public payable {
        require(msg.value >= amount * 2 ether, "You must pay at least 2 ether / donut");
        require(donutBalances[address(this)] >= amount, "Not enough donuts in the machine");
        donutBalances[address(this)] -= amount;
        donutBalances[msg.sender] += amount;
    }
}
