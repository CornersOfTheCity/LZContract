// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";

contract LZMarket is Ownable {
    using SafeMath for uint;

    address private nftAddress;

    struct Lmarket {
        address owner;
        uint256 nftId;
        uint256 price;
        address buyer;
        uint256 startTime;
        uint256 lastTime;
        uint256 state; //0:free, 1:onsale, 2:cancelSell, 3:bought 4:lost 
    }

    mapping(uint256 => Lmarket) public lMarkets;

    uint256 globalId = 0;

    constructor(address nft){
        nftAddress = nft;
    }

    event Sell(uint256 nftId,uint256 nftPrice,uint256 timeLast);
    event CancelSell(uint256 tokenId);
    event Buy(uint256 tokenId, address buyer);
    event Retrieval(uint256 tokenId);

    /*
     * @description: sell NFT
     * @param  {*}
     * @return {*}
     * @param {uint256} nftId
     * @param {uint256} nftPrice
     * @param {uint256} timeLast
     */    
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

        emit Sell(nftId,nftPrice,timeLast);
    }

    /*
     * @description: stop selling
     * @param  {*}
     * @return {*}
     * @param {uint256} nftId
     */    
    function cancelSell(uint256 nftId) external {
        require(_msgSender() == lMarkets[nftId].owner,"not NFT owner");
        require(lMarkets[nftId].state == 1,"not onsell");
        IERC721(nftAddress).safeTransferFrom(address(this),_msgSender(),nftId);
        lMarkets[nftId].state = 2;
        emit CancelSell(nftId);
    }

    /*
     * @description: buy NFT
     * @param  {*}
     * @return {*}
     * @param {uint256} nftId
     */    
    function buy(uint256 nftId) external payable {
        require(msg.value == lMarkets[nftId].price,"wrong msg value");
        require(lMarkets[nftId].state == 1,"not onsell");
        payable(address(lMarkets[nftId].owner)).transfer(lMarkets[nftId].price);
        IERC721(nftAddress).safeTransferFrom(address(this),_msgSender(),nftId);
        lMarkets[nftId].state = 3;
        emit Buy(nftId, _msgSender());
    }

    /*
     * @description: claim NFT
     * @param  {*}
     * @return {*}
     * @param {uint256} nftId
     */    
    function retrieval(uint256 nftId) external {
        require(_msgSender() == lMarkets[nftId].owner,"not NFT owner");

        uint256 stopTime = lMarkets[nftId].startTime + lMarkets[nftId].lastTime; 
        require(stopTime<=block.timestamp,"time not arrive");

        IERC721(nftAddress).safeTransferFrom(address(this),_msgSender(),nftId);
        lMarkets[nftId].state = 4;

    }

    receive() external payable {}

    fallback() external payable{}

}