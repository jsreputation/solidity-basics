// Function Modifier

// Modifiers are code that can be run before and / or after a function call.

// Modifiers can be used to:

//     Restrict access
//     Validate inputs
//     Guard against reentrancy hack

contract FunctionModifier {
    address public owner;
    uint public x = 10;
    bool public locked;

    constructor() {
        // set the transaction sender as the owner of the contract
        owner = msg.sender;
    }
    // check the caller is the owner of the contract
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        // this is only used in modifier to tell solidity to excute the rest of the code
        _;
    }

    modifier validAddress(address _addr) {
        require(_addr != address(0), "Not valid address");
        _;
    }

    function changeOwner(address _newOwner) 
        public onlyOwner validAddress(_newOwner) {

    }
    // modifiers can be called before and/ or after a function
    // This modifier prevents a function from being called while
    // it is still executing
    modifier noReentrancy() {
        require(!locked, "NO reentrancy");
        locked = true;
        _;
        locked = false;
    }

    function decrement(uint i) public noReentrancy {
        x -= i;

        if (i > 1) {
            decrement(i - 1);
        }
    }
}