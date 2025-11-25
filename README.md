# 💸 Payable Contract: Secure Ether Handling & Events

Continuing my **Master in Blockchain Development** at **BlockChain Accelerator Academy**, this project focuses on the native capability of the EVM to handle value: **Sending and Receiving Ether**.

As a **Java Software Engineer**, handling payments usually involves external APIs. In **Solidity**, money is a primitive type. This project demonstrates the modern, secure way to transfer Ether, moving away from legacy functions and implementing gas-efficient patterns.

## 💡 Project Overview

The goal of this contract is to demonstrate best practices for financial transactions on Ethereum:

### 🔍 Key Technical Features:

* **Modern Transfer (`.call` vs `transfer`):**
    * I avoided the legacy `transfer()` function (which has a hardcoded 2300 gas limit). Instead, I used `.call{value: amount}("")`, which is forward-compatible with smart wallets and complex contracts.
* **Direct Deposits (`receive`):**
    * Implemented the special `receive() external payable` function to allow the contract to accept ETH directly from wallets without needing to call a specific named function.
* **Gas Optimization (Custom Errors):**
    * Instead of using expensive `require` strings, I implemented `error TransferFailed()` and `error InsufficientBalance()`. This saves deployment and runtime gas.
* **Observability (Events):**
    * Emitting `Deposit` and `Withdrawal` events. This is crucial for off-chain applications (Frontends/Indexers) to track the flow of funds.

## 🛠️ Stack & Tools

* **Language:** Solidity `^0.8.24`
* **Patterns:** Checks-Effects-Interactions, Custom Errors.
* **License:** GPL-3.0-only

---

*This project highlights the importance of forward compatibility and gas optimization in financial transactions.*
