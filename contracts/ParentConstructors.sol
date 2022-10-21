// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

/* Calling Parent Constructors */
// 2 ways to call parent constructors
// Order of initialization

contract S {
    string public name;

    constructor (string memory _name) {
        name = _name;
    }
}


contract T {
    string public text;

    constructor (string memory _text) {
        text = _text;
    }
}

// 1. If you know what params you will pass before-hand
contract U is S("Success"), T("Treasure") {
    
}

// 2. 
contract V is S, T {
    constructor(string memory _name, string memory _text) S(_name) T(_text) {

    }
}
// You can combine both
contract VV is S("Success"), T {
    constructor(string memory _text) T(_text) {

    }
}

// Order of initialization
// The order in which the parent constructors are called is S, T regardless:
// Order of execution
// 1. S
// 2. T
// 3. V0
contract V0 is S, T {
    constructor(string memory_name, string memory _text) S(_text) T(_name) {

    }
}
// Order of execution
// 1. S
// 2. T
// 3. V1
contract V1 is S, T {
    constructor(string memory_name, string memory _text) T(_name) S(_text) {

    }
}

// Order of execution
// 1. T
// 2. S
// 3. V2
contract V2 is T, S {
    constructor(string memory_name, string memory _text) T(_name) S(_text) {

    }
}

// Order of execution
// 1. T
// 2. S
// 3. V3
contract V3 is T, S {
    constructor(string memory_name, string memory _text) S(_text) T(_name) {

    }
}



