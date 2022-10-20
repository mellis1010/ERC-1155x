// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../ERC1155x.sol";

/**
 * @title ERC1155x example implementation
 */
contract Example is ERC1155 {
    uint256 public supply; // tokenID's

    constructor(string memory uri) ERC1155(uri) {}

    function setURI(string memory newuri) public {
        _setURI(newuri);
    }

    function mint(address to, uint256 id) public {
      // amount is always 1    memory bytes, required param for IERC1155
      //                \       /
      //                 \     /
        _mint(to, supply, 1, '');
        supply++;
    }
 }
