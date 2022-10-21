// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract CallTestContract {
    function setX(TestContract _test, uint _x) external {
       _test.setX(_x);
    }

    function getX(TestContract _test) external view returns (uint x) {
        x = _test.getX();
    }

    function setXAndSendEther(address _test, uint _x) external payable {
       TestContract(_test).setXandReceiveEther{value: msg.value}(_x);
    }

    function getXAndValue(address _test) external view returns (uint x, uint value) {
        (x, value) = TestContract(_test).getXAndValue();
    }

} 

contract TestContract {
    uint public x;
    uint public value = 123;

    function setX(uint _x) external {
        x = _x;
    }

    function getX() external view returns (uint) {
        return x;
    }

    function setXandReceiveEther(uint _x) external payable {
        x = _x;
        value = msg.value;
    }

     function getXAndValue() external view returns (uint, uint) {
        return (x, value);
    }
}