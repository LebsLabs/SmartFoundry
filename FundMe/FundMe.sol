//SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol"; 
import {PriceConverter} from "./PriceConverter.sol";

error NotOwner(); // Require to be the owner otherwise do not proceed. 

contract FundMe {    
    using PriceConverter for uint256; 

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded; 

    // Remember Constant or Immutable Variable.    
    address public i_owner;
    uint256 public constant MINIMUM_USD = 5e18;  
    
    constructor() {
        i_owner = msg.sender; // Alright, not == but =, ! 
    }

    // fund, getVersion, modifier, and withdraw are "on a same level".
    function fund() public payable {
        require(msg.value.getConversionRate() >= MINIMUM_USD, "did not send enough ETH"); // 1e18 = 1 ETH = 1000000000000000000
        addressToAmountFunded[msg.sender] += msg.value; // addressToAmountFunded[msg.sender] += msg.value;  
        funders.push(msg.sender); // OK! 
    }

    function getVersion() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.version();
    }

    modifier onlyOwner() {
        if (msg.sender != i_owner) revert NotOwner();
        _;
    }

    /* sttarting index, ending index, step amount */
    //code
    //reset array 
    //actaully withdraw
    function withdraw() public onlyOwner { //onlyOwner was missing in the code.
        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            address funder = funders[funderIndex];  
            addressToAmountFunded[funder] = 0;
        }
        //reset funders array
        funders = new address[](0);
    
    //transfer
    //call
        (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}(""); 
        require(callSuccess, "Call failed"); 
    //send
    //modifier
    //require msg.sender == owner
    //_;
    }
   
    //msg.sender = address
    //payable(msg.sender) = payable address
    receive() external payable {
    fund();
    }

    fallback() external payable {
    fund();
    }
}
