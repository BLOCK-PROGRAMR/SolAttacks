// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;


contract Vulnerablecontract{


    bool locked=false;//default  is false
    mapping (address=>uint256) public balances;

    modifier  norentrant(){
        require(!locked,"reentrancy is happened!!");
        _;
        locked=true;

    }

    function Deposit(uint amount)external payable{
        balances[msg.sender]+=amount;

    }
    function withdraw()external payable norentrant(){
        uint256 bal=balances[msg.sender];
        require(bal>0);
        (bool check,)=payable(msg.sender).call{value:bal}("");
        require(check,"transaction is failed");
        balances[msg.sender]=0;

    }
    function getAccountBalance()public view returns(uint256){
           return  balances[address(this)];
    }
}