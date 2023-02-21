# ERC-1155X
An implementation of ERC1155x, a highly optimized smart contract with low gas cost for deployment and secondary transfers. This is a totally NON-fungible implementation of ERC1155 and therefore this contract DOES NOT support tokens with a supply that is greater than 1.

To use the ERC1155x contract in your project, copy contracts/ERC1155x to your project's contract directory and then you can import ERC1155x and write an implementation that extends the contract as is ERC1155.

This contract DOES NOT maintain tokenID enumeration. You will need to implement a counter for it in your contract, similar to how supply is implemented in the Example.sol contract. 

>>>>(((((||||||<<<<<<*** " NERD BONUS " ***>>>>>>||||||)))))<<<<<

If you really want to get crazy and claim you are using the most gas optimized NFT smart contract, you could eliminate the fallback function due to the function selector being all zeros, so if anyone sends ether directly to your contract, the transaction will revert. Only if you really want to be "that guy"...

For all you Chads:

pragma solidity 0.8.13;

contract ExampleMint {

    uint256 public constant MAX_SUPPLY = 10000;
    address[MAX_SUPPLY] _owners;
    uint256 public constant PRICE = 0.01 ether;
    uint256 private index = 1;
    
    event TransferSingle(address, address, address, uint256, uint256);

    function mint_efficient_1268F998() external payable {
        require(msg.value == PRICE, "wrong price");
        uint256 _index = index;
        require(_index < MAX_SUPPLY, "supply limit");

        emit TransferSingle(msg.sender, address(0), msg.sender, _index, 1);
        assembly {
            sstore(add(_owners.slot, _index), caller())
        }

        unchecked {
            _index++;
        }
        index = _index;
    }
}




Peace
