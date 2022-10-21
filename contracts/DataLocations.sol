// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

// Data locations:
// storage - means data is a state variable (usually when u want to modify the data)
// memory - means data is loaded on to memory
// calldata = is like memory but only used for function inputs (potentially saves gas)

contract DataLocations {
    struct MyStruct {
        uint foo;
        string text;
    }

    mapping(address => MyStruct) public myStructs;
 
    function examples(uint[] calldata y, string calldata s) external returns (uint[] memory) {
        myStructs[msg.sender] = MyStruct({foo: 123, text: "bar"});

        MyStruct storage myStruct = myStructs[msg.sender];
        myStruct.text = "foo";

        MyStruct memory readOnly = myStructs[msg.sender];
        readOnly.foo = 456; // since data is loaded to memory, this line's change won't be saved after function execution

        _internal(y);

        uint[] memory memArr = new uint[](3);
        memArr[0] = 234;
        return memArr;
    }

    function _internal(uint[] calldata y) private {
        uint x = y[0];
    }


}
