//  SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "./PriceConverter.sol";

contract FundMe{
    using PriceConverter for uint256;
    uint256 public limitAmount = 50 * 10 ** 18;
    address[] public senders;
    mapping(address => uint256) public senderAndAmountSent;

    function fund() public payable {
        require(msg.value.getConversionRate() >= limitAmount, "Didn't send enough");
        senders.push(msg.sender);
        senderAndAmountSent[msg.sender] =msg.value;

    }

    

    // function widthdraw() public {

    // }
}