//  SPDX-License-Identifier: MIT
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

pragma solidity ^0.8.0;

library PriceConverter{

    function getPrice() public view returns(uint256) {
        AggregatorV3Interface aggregatorV3Interface = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);

        (, int256 price,,,) = aggregatorV3Interface.latestRoundData();
        return uint256(price * 1e10);
    }

    function getConversionRate(uint256 ethAmount) public view returns(uint256){
        uint256 ethPrice = getPrice();
        uint256 convertedPrice = (ethPrice * ethAmount)/1e18;
        return convertedPrice;
    }
}