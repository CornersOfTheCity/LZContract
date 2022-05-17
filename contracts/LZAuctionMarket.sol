pragma solidity ^0.8.0;
//pragma experimental ABIEncoderV2;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";
import "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";

contract AuctionMarket is Ownable, IERC721Receiver {
    using SafeMath for uint256;
    address private nftAddress;

    struct Lmarket {
        address owner;
        uint256 num;
        uint256 price;
        address buyer;
        uint256 state; //0:free, 1:onsale, 2:cancelSell, 3:bought 
    }

}