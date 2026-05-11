# Escrow Smart Contract

A decentralized Escrow Smart Contract built using Solidity that securely manages transactions between a buyer and seller.

The contract acts as a trusted middleman where funds remain locked until the buyer confirms delivery. If any issue occurs, the admin can refund the buyer.

## Overview

Traditional online transactions often depend on third-party intermediaries to build trust between buyers and sellers.

This smart contract demonstrates how blockchain technology can automate trust using Ethereum Smart Contracts.

## Workflow
Buyer deploys the contract
Seller address is added during deployment
Buyer deposits ETH into escrow
Seller delivers product/service
Buyer confirms delivery
Payment is released to seller

If a dispute occurs:

Admin can refund the buyer
## Features

1. Buyer and seller setup
2. Admin role management
3. Secure ETH deposit system
4. Delivery confirmation system
5. Seller payment release
6. Refund functionality
7. State management using enum
8. Access control with require()
9. Secure ETH transfer using call()

## Technologies Used
Solidity ^0.8.0
Ethereum
Remix IDE
## Project Structure
Escrow/
│── Escrow.sol
│── README.md

## Smart Contract Logic
1. Contract Deployment

When deployed:

Deployer becomes buyer
Seller address is initialized
Admin role is assigned
Initial state becomes:
AWAITING_PAYMENT
2. Deposit Function

Buyer deposits ETH into escrow.

Function:

function deposit() public payable

Conditions:

Only buyer can deposit
Payment should happen only once

After payment:
State changes to:

AWAITING_DELIVERY
3. Confirm Delivery Function

Buyer confirms successful delivery.

Function:

function confirmDelivery() public

Conditions:

Only buyer can confirm
Product/service must be delivered

After confirmation:

Seller receives payment
Contract state becomes:
COMPLETE
4. Refund Function

Admin can refund the buyer if the deal fails.

Function:

function refund() public

Conditions:

Only admin can refund
Payment must already exist

After refund:
State becomes:

REFUNDED

## How to Test in Remix
Step 1 — Deploy Contract

Input seller address:

0xSellerAddress

Example setup:

Account 1 → Buyer/Admin
Account 2 → Seller
Step 2 — Deposit ETH
Set VALUE in Remix
Example:
1 ETH
Click:
deposit()

Verify:

currentState = 1

Meaning:

AWAITING_DELIVERY
Step 3 — Confirm Delivery

Click:

confirmDelivery()

Result:

Seller receives ETH
State becomes:
COMPLETE
Step 4 — Refund Scenario

Instead of delivery confirmation:

Click:

refund()

Result:

Buyer receives ETH back
State becomes:
REFUNDED

## Security Features
1.Only buyer can deposit payment
2.Only buyer confirms delivery
3.Only admin can refund
4.Invalid actions restricted using require()
5.Secure ETH transfer using call()

## Author

Noshock
