// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Escrow{
    address public buyer;
    address payable public seller;
    address public admin;

    uint public amount;

    enum state{
        AWAITING_PAYMENT,
        AWAITING_DELIVERY,
        COMPLETE,
        REFUNDED
    }

    state public currentstate;

    constructor(address payable _seller) {
        buyer = msg.sender;
        seller = _seller;
        admin = msg.sender;

        currentstate = state.AWAITING_PAYMENT;
    }

    modifier onlyBuyer() {
        require(msg.sender == buyer, "only buyer");
        _;
    }

    function deposit() public payable {
        require(msg.sender == buyer, "only buyer can pay");

        require(currentstate == state.AWAITING_PAYMENT, "payment already done");

        amount = msg.value;

        currentstate = state.AWAITING_DELIVERY;
    }

    function confirmDelivery() public {
        require(msg.sender == buyer, "only buyer can confirm");

        require(currentstate == state.AWAITING_DELIVERY, "invalid state");

        currentstate = state.COMPLETE;

        (bool success, ) = seller.call{value: amount}("");


        require(success, "payment failed");
        

    }
    function refund() public {
        require(msg.sender == admin, "only admin");

        require(currentstate == state.AWAITING_DELIVERY, "Invalid state");

        currentstate = state.REFUNDED;

        (bool success, ) = payable(buyer).call{value: amount}("");
        require(success, "Refund failed");
    }
}