// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/IERC721Metadata.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract LZNFT is Ownable, ERC721Enumerable, IERC721Receiver {
    using SafeMath for uint256;

    struct LNFT {
        string lName;
        string lUrl;
        string lExplain;
    }

    uint256 totalId = 0;

    uint256 mintFee = 0;

    mapping(uint256 => LNFT) public LNFTs;

    constructor(){}

    function changeMintFee(uint256 newFee) external onlyOwner{
        mintFee = newFee;
    }

    function mintFree(string memory name,string memory url,string memory explain) external onlyOwner {
        LNFT memory lnft;
        lnft.lName = name;
        lnft.lUrl = url;
        lnft.lExplain = explain;

        _safeMint(_msgSender(), totalId);
        LNFTs[totalId] = lnft;
        totalId++;
    }

    function createWithFee(string memory name,string memory url,string memory explain) external payable {
        require(msg.value == mintFee,"wrong msg value");
        payable(address(this)).transfer(mintFee);

        LNFT memory lnft;
        lnft.lName = name;
        lnft.lUrl = url;
        lnft.lExplain = explain;

        _safeMint(_msgSender(), totalId);
        LNFTs[totalId] = lnft;
        totalId++;

    }

    function claimFee() external payable onlyOwner{
        if(address(this).balance>0){
          payable(owner()).transfer(address(this).balance);
        }
    }

   function onERC721Received(address, address, uint256, bytes calldata) external pure returns (bytes4) {
        return this.onERC721Received.selector;
    }

    receive() external payable {}

    fallback() external payable{}

    
}