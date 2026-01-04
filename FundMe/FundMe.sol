// SPDX-License-Identifier: MIT

pragma solidity 0.8.24; 

import {PriceConverter} from "./PriceConverter.sol"; 

contract FundMe {
    using PriceConverter for uint256; 

    uint256 public minimumUsd = 5e18; 

    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded; 
    
    //address public owner; 
    
    //constructor()

    function fund() public payable {
        
        require(msg.value.getConversionRate() >= minimumUsd, "did not send enough ETH"); // 1e18 = 1 ETH = 1000000000000000000
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value; 

    }

    /* sttarting index, ending index, step amount */
    //code
    //reset the array 
    //actaully withdraw

    //transfer
    //call 
    //send

    //msg.sender = address
    //payable(msg.sender) = payable address

    //modifier
    //require msg.sender == owner
    //_;

}

