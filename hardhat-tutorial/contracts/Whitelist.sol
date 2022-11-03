// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Whitelist {

    //I want to have a max number of addresses
    // authorized in the whitelist
    uint8 public maxWhitelistedAddresses;

    //Here i create a mapping of whitelistedAddresses
    //if an address is whitelisted bool =true
    mapping(address => bool) public whitelistedAddresses;

    //numAddressesWhitelisted used to track
    //of numbers of whitelisted addresses
    uint8 public numAddressesWhitelisted;

    // at the time of contract deployment i will input the 
    //max number of whitelistedAddresses i want 
    constructor(uint8 _maxWhitelistedAddresses) {
           maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    // i create a function to add the address of the sender to 
    //the whitelist
    function addAddressToWhitelist() public {
        // already added addresses can't be added again
        require(!whitelistedAddresses[msg.sender], "Sender is already on whitelist");
        // i don't want to exceed
        //my max number of addresses permitted on the whitelist
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "The whitelist is full");
        //now let's add the sender address
        // to our mapping
        whitelistedAddresses[msg.sender] = true;
        //update the new number of already registered addresses
        numAddressesWhitelisted +=1;
    }

}