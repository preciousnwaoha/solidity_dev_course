// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

/*
Cryptographic Hash Functions are widely used in solidity.
Some of the use cases are:
1. Sign a signature
2. Come up with a unique id
3. Create a contract that is protected from front running (commit reveal scheme
*/

// How to use the Keccak256 Hash Function

contract HashFunc {
    function hash(string memory text, uint num, address addr) external pure returns (bytes32) {
        return keccak256(abi.encodePacked(text, num, addr));
    }

    /*
        Difference between abi.encode and abi.encodePacked
    */
    function encode(string memory text0, string memory text1) external pure returns (bytes memory) {
        return abi.encode(text0, text1);
    }

    function encodePacked(string memory text0, string memory text1) external pure returns (bytes memory) {
        return abi.encodePacked(text0, text1);
    }

    function collision (string memory text0, string memory text1) external pure returns (bytes32) {
        return keccak256(abi.encodePacked(text0, text1));
    }

    // Note: you can avoid collision by making sure no Dynamic datatypes are next to each other in arguments

    function noCollision (string memory text0, uint x, string memory text1) external pure returns (bytes32) {
        return keccak256(abi.encodePacked(text0, x, text1));
    }
}


