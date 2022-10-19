// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SolSyntax{
    bool public isTime = (1 days == 24 hours);

    function makefalse() public {
        isTime = (1 days == 25 hours);
    }
    
    function makeTrue() public {
        isTime = (7 days == 1 weeks);
    }
}