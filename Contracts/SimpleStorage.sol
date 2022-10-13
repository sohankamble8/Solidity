// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract SimpleStorage{

    uint256 favouriteNumber;

    struct Student{
        uint256 rollNo;
        string name;
    }

    Student[] students;
    mapping(uint256 => string) public rollNoToNameMap;

    function addStudent(string memory _name, uint256 _rollNo) public{
        students.push(Student(_rollNo, _name));
        rollNoToNameMap[_rollNo] = _name;
    }

    function store(uint256 _favouriteNumber) public virtual {
        favouriteNumber = _favouriteNumber;
    }

    function retrieve() public view returns(uint256){
        return favouriteNumber;
    }

    function getStudent(uint256 _rollNo) public view returns(string memory, uint256){
        return (rollNoToNameMap[_rollNo], _rollNo);
    }

}