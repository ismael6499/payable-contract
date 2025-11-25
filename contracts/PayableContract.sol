// SPDX-License-Identifier: GPL-3.0-only
pragma solidity 0.8.24; 

error TransferFailed();
error InsufficientBalance(uint256 requested, uint256 available);

contract PayableContract {

    event Withdrawal(address indexed to, uint256 amount);
    event Deposit(address indexed from, uint256 amount);

    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }

    function sendEther() public payable {
        emit Deposit(msg.sender, msg.value);
    }

    function withdrawEther(uint256 amount) public {
        if (address(this).balance < amount) {
            revert InsufficientBalance(amount, address(this).balance);
        }

        (bool success, ) = msg.sender.call{value: amount}("");
        
        if (!success) {
            revert TransferFailed();
        }

        emit Withdrawal(msg.sender, amount);
    }
}
