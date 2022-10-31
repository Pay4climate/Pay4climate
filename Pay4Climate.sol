// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CARBONCREDITS is ERC20, ERC20Burnable, Ownable {
    address payable public _account2 = payable(0xB36818759dF4D82A96F3160c4cf97547E77B3988);

    // Initializing 1000 Carbon_Credits (ERC_20s)
    constructor() ERC20("CARBONCREDITS", "CC") {
        _mint(address(this), 1000);
    }

    // Only owner of contract can mint more carbon credits
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // this funciton will give you address of contract
    function contractAddress() public view returns(address){
        return address(this);
    }
    
    // this function will send carbon credits to address
    function sendToAddress(uint amount) public returns(bool){
        uint percentageToSend = (amount/100)*1;
        _transfer(address(this), _account2, percentageToSend);
        return true;
    }

}
