// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

/*
Fallback executed when
- function doesn't exist
- directly send Eth
*/

contract Fallback {
    event Log(string func, address sender, uint value, bytes data);
    
    fallback() external payable { // would still be called if recieve doesn't exist
        emit Log("fallback", msg.sender, msg.value, msg.data);
    }

    // receive() external payable {
    //     emit Log("receive", msg.sender, msg.value, "");
    // }

}