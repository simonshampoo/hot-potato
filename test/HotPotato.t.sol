// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Vm.sol";
import "forge-std/Test.sol";
import "../src/HotPotato.sol";
import "forge-std/Vm.sol";

contract HotPotatoTest is Test {
    HotPotato hotPotato;

    function setUp() public {
        hotPotato = new HotPotato();
    }

    function testSend() public {
        address sender = address(1);
        address receiver = address(2);
        vm.startPrank(sender);

        vm.deal(sender, 1 ether);

        hotPotato.heatPotato(payable(receiver));
        vm.stopPrank();
        assertTrue(receiver.balance == 1 ether);
        assertTrue(sender.balance == 0 ether);
    }

    //    function testIncrement() public {
    //        assertEq(counter.number(), 1);
    //    }
    //
    //    function testSetNumber(uint256 x) public {
    //        counter.setNumber(x);
    //        assertEq(counter.number(), x);
    //    }
}
