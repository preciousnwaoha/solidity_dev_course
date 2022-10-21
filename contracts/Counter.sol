// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Counter {
    uint public count = 5;

    function inc() external {
        count += 1;
    }

    function dec() external {
        count -= 1;
    }
    
}