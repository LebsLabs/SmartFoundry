// SPDX-License-Identifier: MIT

pragma solidity 0.8.24; 

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {

SimpleStorage[] public listOfSimpleStorageContracts; 

    function createSimpleStorageContract() public {
        simpleStorage newSimpleStorage = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorage); 
    }

    function sfStore(uint256 simpleStorageIndex, uint256 _newSimpleStorageNumber) public {
        // address
        //ABI - Applciation Binary Interface
        SimpleSotrage mySimpleStorage = listOfStorageContracts[_simpleStorageIndex]; 
    }

}