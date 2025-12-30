// SPDX-License-Identifier: MIT

pragma solidity 0.8.24; 

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol"; 

contract FundMe {

    uint256 public minimumUsd = 5e18; 

    uint256 myAddress;
    
    function fund() public payable {
        
        require(msg.value > minimumUsd, "did not send enough ETH"); // 1e18 = 1 ETH = 1000000000000000000
    }

    function getPrice() public view returns(uint256){
        //address
        //ABI
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 price,,,) = priceFeed.latestRoundData();
         return uint256(price) * 1e10; 
    }
    function getConversionRate(uint256 ethAmount) public view returns(uint256){
        uint256 ethPrice = getPrice(); 
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18; 
        return ethAmountInUsd; 
    }
    
    function getVersion() public view returns (uint256){
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version(); 
    } 

}
