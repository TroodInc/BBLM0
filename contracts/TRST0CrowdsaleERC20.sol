// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.7;

import "./AllowanceCrowdsaleERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TRST0CrowdsaleERC20 is AllowanceCrowdsaleERC20 {
    uint256 private _initialSupply;
    uint256 private _tokenSold;

    constructor(
        uint256 rate, // rate in base units
        address payable wallet,
        address tokenWallet,
        ERC20 token_,
        ERC20 tokenBuy_
    )
        Crowdsale(rate, wallet, token_)
        AllowanceCrowdsale(tokenWallet)
        AllowanceCrowdsaleERC20(tokenBuy_)
    {
        _initialSupply = token().totalSupply();
    }

    function _deliverTokens(address beneficiary, uint256 tokenAmount)
        internal
        virtual
        override
    {
        super._deliverTokens(beneficiary, tokenAmount);
        _tokenSold += tokenAmount;
    }

    function tokenTotal() public view returns (uint256) {
        return _initialSupply;
    }

    function tokenBurnt() public view returns (uint256) {
        return _initialSupply - token().totalSupply();
    }

    function tokenAvailable() public view returns (uint256) {
        return token().balanceOf(tokenWallet());
    }

    function tokenReceivedFree() public view returns (uint256) {
        return token().totalSupply() - tokenAvailable() - _tokenSold;
    }

    function tokenSold() public view returns (uint256) {
        return _tokenSold;
    }
}
