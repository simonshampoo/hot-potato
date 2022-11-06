// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Martyr {
    /*  
        we will send some ether to this contract 
        then we will call some function that takes in an address
        this function will deploy another contract that selfdestructs in the constructor
        in the selfdestruct we will pass the address of the address  
     */

    /*

         
    */

    constructor(address payable _to) payable {
        selfdestruct(_to);
    }
}
