// View and Pure Functions

// Getter functions can be declared view or pure.

// View function declares that no state will be changed.

// Pure function declares that no state variable will be changed or read.

pragma solidity ^0.8.6;

contract viewAndpure {
    uint public x = 1;

    // promise not to modify the state 
    function addToX(uint y) public view returns (uint) {
        return x + y;
    }

    // promise not to modify or read from the state
    function add(uint i, uint j) public pure returns (uint) {
        return i + j;
    }
}