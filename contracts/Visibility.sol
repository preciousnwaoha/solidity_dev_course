// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

// visibility
// private - only inside contract
// internal  only inside contract and child contracts
// public - inside and outside contract
// external - only from outside contract

contract SimpleStorage {
    
}

/*
 ___________________
| A                 |
| private pri()     |
| internal inter()  |
| public pub()      | <-------------- C
| external ext()    |   pub() and ext()
|___________________|
 ___________________
| B                 |
|                   |
| inter()           | <-------------- C
| pub()             |   pub() and ext()
|___________________|
*/

contract VisibilityBase {
    uint private x = 0;
    uint internal y = 1;
    uint public z = 2;

    function privateFunc() private pure returns (uint) {

    }

    function internalFunc() public pure returns (uint) {

    }

    function publicFunc() public pure returns (uint) {

    }

    function externalFunc() external pure returns (uint) {

    }

    function examples() external view {
        x + y + z;

        privateFunc();
        internalFunc();
        publicFunc();

        this.externalFunc(); // gas inefficient, so don't do
    }
}

contract VisibilityChild is VisibilityBase {
    function examples2() external view {
        y + z;
        internalFunc();
        publicFunc();
        // not can't call {externalFunc()} cause it is int this contract too
    }
}