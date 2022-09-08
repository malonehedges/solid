// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import {ExactMintableERC721} from "./ExactMintableERC721.sol";

contract BurnableExactMintableERC721 is ExactMintableERC721 {
    constructor(string memory name, string memory symbol)
        ExactMintableERC721(name, symbol)
    {}

    function burn(uint256 tokenId) external {
        require(_ownerOf[tokenId] == msg.sender, "unauthorized");
        _burn(tokenId);
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
