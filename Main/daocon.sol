
// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/extensions/draft-ERC20Permit.sol";
import  "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/extensions/ERC20Votes.sol";

contract MyToken is ERC20, ERC20Permit, ERC20Votes, Ownable(){
    constructor() ERC20("MyToken", "MTK") ERC20Permit("MyToken"){
        _mint(msg.sender,100*10);
    }

function mint(address to, uint256 amount) public onlyOwner{
    _mint(to,amount);
}

// The following functions are overrides required for solidity.

function _afterTokenTransfer(address from, address to, uint256 amount)
internal
override(ERC20, ERC20Votes)
{
    super._afterTokenTransfer(from, to, amount);
}

function _mint(address to, uint256 amount)
internal 
override(ERC20, ERC20Votes){
super._mint(to, amount);
}

function _burn(address account, uint256 amount)
internal 
override(ERC20, ERC20Votes){
    super._burn(account, amount);
}

}










