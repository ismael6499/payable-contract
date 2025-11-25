# 💸 Payable Contract: Sending & Receiving Ether Safely

Continuing my **Master in Blockchain Development** at **Blockchain Accelerator Academy**, this project focuses on the native capability of the EVM to handle value: **Sending and Receiving Ether**.

As a **Java Software Engineer**, handling payments usually involves external APIs (like Stripe or PayPal). In **Solidity**, money is a primitive type built into the language itself. However, sending it securely requires understanding the evolution of gas limits.

## 💡 Project Overview

The goal of this contract is to demonstrate the modern, secure way to transfer Ether, moving away from legacy functions.

### 🔍 Key Technical Concepts:

* **`payable` Keyword:** Allows a function to receive Ether and store it in the contract's balance. Without this keyword, the transaction would revert if value is attached.
* **Legacy vs. Modern (`transfer` vs. `call`):**
    * **Legacy (`transfer` / `send`):** Historically, these were used because they capped the gas forwarded to **2300 units**. This prevented reentrancy attacks but became problematic as EVM gas costs changed (EIP-1884), potentially causing transfers to fail unexpectedly.
    * **Modern (`.call`):** The current best practice. It forwards **all available gas**, making it compatible with complex receiving logic (like Smart Wallets or Safe accounts).
* **Security Pattern (Checks-Effects-Interactions):**
    * Because `.call` forwards all gas, it opens the door to Reentrancy attacks. To secure this, we must follow the **Checks-Effects-Interactions** pattern:
        1.  **Check:** Validate conditions (e.g., sufficient balance).
        2.  **Effect:** Update state variables (e.g., deduct balance).
        3.  **Interaction:** Send the ETH (using `.call`).

## 🛠️ Stack & Tools

* **Language:** Solidity `^0.8.24`
* **Methods:** `payable`, `call` (Low-level function).
* **Security:** Handling boolean success flags for low-level calls.
* **License:** GPL-3.0-only

---

*This project highlights the importance of forward compatibility and reentrancy protection in financial transactions.*
