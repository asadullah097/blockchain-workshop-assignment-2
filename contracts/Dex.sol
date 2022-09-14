// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./ERC20.sol";
import "./Erc721.sol";
contract Dex{
    ERC20Token public erc20token;
    IERC721 public myNFT;
    struct User {
        uint256 erc20Balance;
        uint256 erc720Balance;
    }
   //mapping for user details
     mapping(address => User) public userBalances;

     constructor(){
        erc20token = new ERC20Token();
        // myNFT = new MyNFT();
     }

    function exchangeERC20ToERC721(uint256 _amount) public {
        User storage user= userBalances[msg.sender];
        user.erc20Balance-=_amount;
        ERC20Token(erc20token).transferFrom(msg.sender,address(this),_amount);
        // ERC721(token).transferFrom(address(this),msg.sender,_amount);
    }
}
