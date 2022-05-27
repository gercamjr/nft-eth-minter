pragma solidity ^0.8.1;

//We'll first import some OpenZeppelin Contracts. These will provide us with some //utility functions to write the smart contract.
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

//We'll import the Hardhat console to log messages in the terminal for debugging.
import "hardhat/console.sol";

// We inherit the contract we imported. 
// This means we'll have access to the inherited contract's methods.
contract EpicNFT is ERC721URIStorage {
      // Counter given by OpenZeppelin to help us keep track of tokenIds.
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721 ("SquareNFT", "SQUARE") {
        console.log("This is my NFT contract. Woah!");
    }

    function makeAnNFT() public {
             // Get the current tokenId, this starts at 0.

        uint256 newItemId = _tokenIds.current();
        // Mint the NFT to the sender using msg.sender.

        _safeMint(msg.sender, newItemId);

        // set the NFTS data
        _setTOkenURI(newItemId, 'blah');

        //increment the counter for when the next NFT is minted.
        _tokenIds.increment();
    }
}