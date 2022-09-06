// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.15;

import {ERC721} from "solmate/tokens/ERC721.sol";

contract OwnedToken is ERC721 {
    constructor(
        address owner,
        string memory name,
        string memory symbol
    ) ERC721(name, symbol) {
        _mint(owner, 1);
    }

    function tokenURI(uint256)
        public
        view
        virtual
        override
        returns (string memory)
    {
        revert("unimplemented");
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
