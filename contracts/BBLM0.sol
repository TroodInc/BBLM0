// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

/**
 * @title BBLM0
 * 0-version of BBLM token, not providing any obligations from developers and publishers, 
 * but allowing the community to support BambiBloom project and the Trood initiative. 
 * Forked from https://github.com/TroodInc/TRST0
 * Please contact founders and contributors for more information. 
 * Crowdsale: trood.com/tokenplace/projects/bambibloom 
 * Community: trood.com/discord
 * TRST token wiki: trood.com/trst/wiki
 * BBLM0 is a fixed supply token, the supply is 300.000 TRST
 *
 */
contract BBLM0 is ERC20Burnable {
    constructor(
        string memory name_,
        string memory symbol_,
        address payable owner_,
        uint256 supply_
    ) ERC20(name_, symbol_) {
        _mint(owner_, supply_);
    }
}
