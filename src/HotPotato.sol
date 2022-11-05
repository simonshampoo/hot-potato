// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Martyr} from "./Martyr.sol"

contract HotPotato {

    event Deployed(address to, uint256 amount); 

    function getCreationBytecode(address _owner, uint _foo) public pure returns (bytes memory) {
        bytes memory bytecode = type(Wallet).creationCode;

        return abi.encodePacked(bytecode, abi.encode(_owner, _foo));
    }

    function heatPotato(address payable to) payable external returns (address martyr) {
        address martyr; 
        assembly {

            let amtToSend := callvalue()
            let code := 0x60806040526040516100c13803806100c18339818101604052810190602391906098565b8073ffffffffffffffffffffffffffffffffffffffff16ff5b600080fd5b600073ffffffffffffffffffffffffffffffffffffffff82169050919050565b6000606a826041565b9050919050565b6078816061565b8114608257600080fd5b50565b6000815190506092816071565b92915050565b60006020828403121560ab5760aa603c565b5b600060b7848285016085565b9150509291505056fe

            martyr := create(amtToSend, code, 388) 
    
        }        
        emit Deployed(martyr, msg.value)
    }


