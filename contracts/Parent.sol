pragma solidity ^0.4.4;


contract Parent {
    event ParentValueChange(address indexed entity, uint value);

    uint public parentValue;

    function setNewParentValue(uint val) external {
        parentValue = val;
        ParentValueChange(msg.sender, parentValue);
    }
}