// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Supplychain{

    address payable owner;

    struct item {
        uint price;
        string desc;
        address buyer;
    }
    
    mapping(uint => item ) public items ;
    uint private counter = 0 ;

    modifier Onlyowner {
        require (msg.sender == owner);
        _;

    }
    modifier Paidenough(uint _price){
        require(msg.value >= _price);
        _;
    }




    constructor(){
    owner = payable (msg.sender);

     
    }

    function  add(uint _price, string memory _desc) public Onlyowner{
        items[counter]  = item(_price , _desc,address(0));
        counter ++;

    }

    function  buy(uint _id) public payable Paidenough(msg.value){
        owner.transfer(msg.value);
        items[_id].buyer = msg.sender;
    }






}

