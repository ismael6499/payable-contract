// SPDX-License-Identifier: GPL-3.0-only
pragma solidity 0.8.24; 

contract PayableContract {

    function sendEther() public payable {}

    function withdrawEther(uint256 amount) public {
        (bool success, ) = msg.sender.call{value: amount}("");
        require (success, "Transfer failed");
    }

}