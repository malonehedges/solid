// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import {ERC721} from "solmate/tokens/ERC721.sol";

contract OwnedToken is ERC721 {
    string _tokenURI;

    constructor(
        address owner,
        string memory name,
        string memory symbol
    ) ERC721(name, symbol) {
        _mint(owner, 1);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        virtual
        override
        returns (string memory)
    {
        require(tokenId == 1, "invalid token id");
        return _tokenURI;
    }

    function setTokenURI(string calldata tokenURI_) external {
        require(_ownerOf[1] == msg.sender, "unauthorized");
        _tokenURI = tokenURI_;
    }
}

contract TokenOwned {
    OwnedToken immutable _tokenOwnedContract;

    constructor(
        address owner,
        string memory name,
        string memory symbol
    ) {
        _tokenOwnedContract = new OwnedToken(owner, name, symbol);
    }

    modifier onlyOwner() {
        require(_tokenOwnedContract.ownerOf(1) == msg.sender, "unauthorized");
        _;
    }
}
