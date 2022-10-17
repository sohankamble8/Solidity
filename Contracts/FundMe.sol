//  SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "./PriceConverter.sol";


contract FundMe{
    using PriceConverter for uint256;
    uint256 public limitAmount = 50 * 10 ** 18;
    address[] public funders;
    mapping(address => uint256) public funderAndAmountSent;
    address public owner;
    error unWantedResult();
    constructor(){
        owner = msg.sender;
    }

    function fund() public payable {
        require(msg.value.getConversionRate() >= limitAmount, "Didn't send enough");
        funders.push(msg.sender);
        funderAndAmountSent[msg.sender] =msg.value;

    }

    function widthdraw() public {
        for(uint256 funderIndex = 0; funderIndex< funders.length; funderIndex++){
            address funder = funders[funderIndex];
            funderAndAmountSent[funder] = 0;
        }

        funders = new address[](0);
        (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess == true, "Call Failed");
    }

    modifier onlyOwner {
        // require(owner == msg.sender, "You're not Owner for Widthdraw Funds.");
        if(owner == msg.sender){
            revert unWantedResult();
        }
        _;
    }
    receive() external payable{
        fund();
    }

    fallback() external {
        fund();
    }
}