// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import { Martyr } from "./Martyr.sol";

contract HotPotato {
    event Deployed(address to, uint256 amount);

    function getCreationBytecode(
        address to
    ) public pure returns (bytes memory) {
        bytes memory bytecode = type(Martyr).creationCode;

        return abi.encodePacked(bytecode, abi.encode(to));
    }

    function heatPotato(
        address payable to
    ) external payable returns (address martyr) {
        // bytes memory code = getCreationBytecode(to);
        //assembly {
        //    let amtToSend := callvalue()
        //    martyr := create(amtToSend, code, 63)
        //}

        Martyr m = new Martyr{ value: msg.value }(to);

        emit Deployed(martyr, msg.value);

        return address(m); 
    }
}
