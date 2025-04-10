// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Counter} from "../src/Counter.sol";

contract CounterScript is Script {
    Counter public counter;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        // Replace this with your actual deployed address
        counter = Counter(0x5718B2c6B98b91CA4617b7534D2C23B780B13BcB);

        // Call a function on it (example)
         counter.setNumber(69);

        vm.stopBroadcast();
    }
}
