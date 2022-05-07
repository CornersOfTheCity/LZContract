// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";

contract LZMarket is Ownable, IERC721Receiver {
    using SafeMath for uint;

    address private nftAddress;

    struct Lmarket {
        address owner;
        uint256 nftId;
        uint256 price;
        address buyer;
        uint256 startTime;
        uint256 lastTime;
        uint256 state; //0:free, 1:onsale, 2:cancelSell, 3:buy 4:lost 
    }

    mapping(uint256 => Lmarket) public lMarkets;

    uint256 globalId = 0;

    constructor(address nft){
        nftAddress = nft;
    }

    function sell(uint256 nftId,uint256 nftPrice,uint256 timeLast) external {
        Lmarket memory sellNft;
        sellNft.owner = _msgSender();
        sellNft.nftId = nftId;
        sellNft.price = nftPrice;
        sellNft.startTime = block.timestamp;
        sellNft.lastTime = timeLast;
        sellNft.state = 1;

        lMarkets[globalId] = sellNft;

        IERC721(nftAddress).safeTransferFrom(_msgSender(), address(this), nftId);
        globalId ++;

    }

    function cancelSell(uint256 nftId) external {
        require(_msgSender() == lMarkets[nftId].owner,"not NFT owner");
        lMarkets[nftId].state = 2;
        IERC721(nftAddress).safeTransferFrom(address(this),_msgSender(),nftId);
    }

    function buy(uint256 nftId) external payable {


    }

    function retrieval(uint256 nftId) external {
        require(_msgSender() == lMarkets[nftId].owner,"not NFT owner");

        uint256 stopTime = lMarkets[nftId].startTime + lMarkets[nftId].lastTime; 
        require(stopTime<=block.timestamp,"time not arrive");

        IERC721(nftAddress).safeTransferFrom(address(this),_msgSender(),nftId);

    }

    receive() external payable {}

    fallback() external payable{}

}