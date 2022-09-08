// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import {ERC721} from "solmate/tokens/ERC721.sol";

contract MintableERC721 is ERC721 {
    uint256 nextTokenId;

    constructor(string memory name, string memory symbol)
        ERC721(name, symbol)
    {}

    function mint(address to) external {
        _mint(to, ++nextTokenId);
    }

    function tokenURI(uint256)
        public
        view
        virtual
        override
        returns (string memory)
    {
        return "";
    }
}
