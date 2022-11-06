// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Vm.sol";
import "forge-std/Test.sol";
import "../src/HotPotato.sol";

contract HotPotatoTest is Test {
    HotPotato hotPotato;

    function setUp() public {
        hotPotato = new HotPotato();
    }

    function testSend() public {}

    //    function testIncrement() public {
    //        assertEq(counter.number(), 1);
    //    }
    //
    //    function testSetNumber(uint256 x) public {
    //        counter.setNumber(x);
    //        assertEq(counter.number(), x);
    //    }
}
