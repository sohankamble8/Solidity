//  SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
 
import "./SimpleStorage.sol";


contract StorageFactory{
    SimpleStorage simpleStorage;
    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorage() public {
        simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    function sfAddStudent(uint256 _rollNo, string memory _name) public{
        simpleStorage.addStudent(_name, _rollNo);
    }
    function sfGetStudent(uint256 _index, uint256 _rollNo) public view returns(string memory, uint256){
        return simpleStorageArray[_index].getStudent(_rollNo);
    }

    function sfStore(uint256 _favouriteNumber) public {
        simpleStorage.store(_favouriteNumber);
    }

    function sfGetFavouriteNo(uint256 _index) public view returns(uint256) {
        return simpleStorageArray[_index].retrieve();
    }
}
