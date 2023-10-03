
// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract ExceptionHandlingExample {
    uint public value;

    function setValue(uint _value) public {
        require(_value > 0, "Value must be greater than zero");
        value = _value;
    }

    function assertExample() public view {
        uint a = 1;
        uint b = 2;
        assert(a == b);
    }

    function revertExample() public pure {
        revert("This transaction has been reverted");
    }
}
