// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Inheritance{
    address[] private wallets;
    mapping(address => uint) inheritance;
    address private owner;
    uint256 private amount;
    bool private deseased;
    constructor() payable{
        owner = msg.sender;
        amount = msg.value;
        deseased = false;
    }

    modifier onlyOwner {
        if(owner == msg.sender){}
        _;
    }

    modifier isDeseased{
        if(deseased == true){}
        _;
    }
    function setup(address _wallet, uint256 _amount) public onlyOwner{
        wallets.push(_wallet);
        inheritance[_wallet] = _amount;
    }

    function sendMoney() private isDeseased {
        for(uint i=0;i<wallets.length;i++){
            // address.transfer(amount);
            payable(wallets[i]).transfer(inheritance[wallets[i]]);
        }
    }

    function died() public onlyOwner {
        deseased = true;
        sendMoney();
    }
}