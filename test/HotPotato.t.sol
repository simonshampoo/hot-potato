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

    function testSend() public {
        address sender = address(1);
        address receiver = address(2);
        vm.startPrank(sender);

        vm.deal(sender, 1 ether);

        console.log("Receiver balance before: %s", receiver.balance);
        console.log("Sender balance before: %s", sender.balance);
        address(hotPotato).call{ value: sender.balance }(abi.encodeWithSignature(""));
        vm.stopPrank();

        console.log("Receiver balance after: %s", receiver.balance);
        console.log("Sender balance after: %s", sender.balance);

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
