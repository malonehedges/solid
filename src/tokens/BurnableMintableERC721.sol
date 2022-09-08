// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import {MintableERC721} from "./MintableERC721.sol";

contract BurnableMintableERC721 is MintableERC721 {
    constructor(string memory name, string memory symbol)
        MintableERC721(name, symbol)
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
