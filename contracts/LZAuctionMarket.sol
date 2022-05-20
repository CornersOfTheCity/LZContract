// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// import "@openzeppelin/contracts/utils/math/SafeMath.sol";
// import "@openzeppelin/contracts/access/Ownable.sol";
// import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
// import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";

library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryAdd(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            uint256 c = a + b;
            if (c < a) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function trySub(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b > a) return (false, 0);
            return (true, a - b);
        }
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryMul(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
            // benefit is lost if 'b' is also tested.
            // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
            if (a == 0) return (true, 0);
            uint256 c = a * b;
            if (c / a != b) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the division of two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryDiv(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a / b);
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryMod(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a % b);
        }
    }

    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return a - b;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        return a * b;
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator.
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return a / b;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return a % b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {trySub}.
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b <= a, errorMessage);
            return a - b;
        }
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a / b;
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting with custom message when dividing by zero.
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {tryMod}.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a % b;
        }
    }
}

interface IERC20 {
    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);

    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `to`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address to, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `from` to `to` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);
}

interface IERC721Receiver {
    /**
     * @dev Whenever an {IERC721} `tokenId` token is transferred to this contract via {IERC721-safeTransferFrom}
     * by `operator` from `from`, this function is called.
     *
     * It must return its Solidity selector to confirm the token transfer.
     * If any other value is returned or the interface is not implemented by the recipient, the transfer will be reverted.
     *
     * The selector can be obtained in Solidity with `IERC721Receiver.onERC721Received.selector`.
     */
    function onERC721Received(
        address operator,
        address from,
        uint256 tokenId,
        bytes calldata data
    ) external returns (bytes4);
}

abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }
}

abstract contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor() {
        _transferOwnership(_msgSender());
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view virtual returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(owner() == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public virtual onlyOwner {
        _transferOwnership(address(0));
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        _transferOwnership(newOwner);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Internal function without access restriction.
     */
    function _transferOwnership(address newOwner) internal virtual {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
}

interface IERC165 {
    /**
     * @dev Returns true if this contract implements the interface defined by
     * `interfaceId`. See the corresponding
     * https://eips.ethereum.org/EIPS/eip-165#how-interfaces-are-identified[EIP section]
     * to learn more about how these ids are created.
     *
     * This function call must use less than 30 000 gas.
     */
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}

interface IERC721 is IERC165 {
    /**
     * @dev Emitted when `tokenId` token is transferred from `from` to `to`.
     */
    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);

    /**
     * @dev Emitted when `owner` enables `approved` to manage the `tokenId` token.
     */
    event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);

    /**
     * @dev Emitted when `owner` enables or disables (`approved`) `operator` to manage all of its assets.
     */
    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);

    /**
     * @dev Returns the number of tokens in ``owner``'s account.
     */
    function balanceOf(address owner) external view returns (uint256 balance);

    /**
     * @dev Returns the owner of the `tokenId` token.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function ownerOf(uint256 tokenId) external view returns (address owner);

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes calldata data
    ) external;

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`, checking first that contract recipients
     * are aware of the ERC721 protocol to prevent tokens from being forever locked.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If the caller is not `from`, it must be have been allowed to move this token by either {approve} or {setApprovalForAll}.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    /**
     * @dev Transfers `tokenId` token from `from` to `to`.
     *
     * WARNING: Usage of this method is discouraged, use {safeTransferFrom} whenever possible.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must be owned by `from`.
     * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    /**
     * @dev Gives permission to `to` to transfer `tokenId` token to another account.
     * The approval is cleared when the token is transferred.
     *
     * Only a single account can be approved at a time, so approving the zero address clears previous approvals.
     *
     * Requirements:
     *
     * - The caller must own the token or be an approved operator.
     * - `tokenId` must exist.
     *
     * Emits an {Approval} event.
     */
    function approve(address to, uint256 tokenId) external;

    /**
     * @dev Approve or remove `operator` as an operator for the caller.
     * Operators can call {transferFrom} or {safeTransferFrom} for any token owned by the caller.
     *
     * Requirements:
     *
     * - The `operator` cannot be the caller.
     *
     * Emits an {ApprovalForAll} event.
     */
    function setApprovalForAll(address operator, bool _approved) external;

    /**
     * @dev Returns the account approved for `tokenId` token.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function getApproved(uint256 tokenId) external view returns (address operator);

    /**
     * @dev Returns if the `operator` is allowed to manage all of the assets of `owner`.
     *
     * See {setApprovalForAll}
     */
    function isApprovedForAll(address owner, address operator) external view returns (bool);
}

contract AuctionMarket is Ownable {
    using SafeMath for uint256;

    address nftAddress;
    address tokenAddress;

    address transitAddress;

    //uint256 timeLast = 21600;
    uint256 mainBidAdd = 0.01 ether;
    uint256 tokenBidAdd = 1 ether;

    struct Lmarket {
        address owner;
        uint256 num;
        uint256 price;
        uint256 sellType;
        address newestBuyer;
        uint256 timeLast;
        uint256 newestTime;
        uint256 state; //0:free, 1:onsale, 2:cancelSell, 3:bought ,4 retrieval
    }

    uint256 constant USE_MAIN = 0;
    uint256 constant USE_USDT = 1;

    mapping(uint256 => Lmarket) public AMarkets;

    uint256 public globalId = 0;

    constructor(address nft,address usdt,address transit){
        nftAddress = nft;
        tokenAddress = usdt;
        transitAddress = transit;
    }

    event AuctionSell(address seller,uint256 nftId,uint256 sellType,uint256 nftPricet,uint256 timeLast);
    event AuctionCancelSell(address canceler, uint256 tokenId);
    event AuctionBid(address bider,uint256 tokenId,uint256 bidType, uint256 price,uint256 newStartTime);
    event AuctionClaim(address claimer,uint256 tokenId);
    event AuctionRetrieval(address retrievaler,uint256 tokenId);

    function changeMainBidAdd(uint256 addBid) external onlyOwner(){
        mainBidAdd = addBid;
    }
    function changeTokenBidAdd(uint256 addBid) external onlyOwner(){
        tokenBidAdd = addBid;
    }

    function sell(uint256 nftId,uint256 sellType,uint256 nftPrice,uint256 lastTime) external {
        Lmarket memory sellNft;
        sellNft.owner = _msgSender();
        sellNft.num = globalId;
        sellNft.price = nftPrice;
        sellNft.sellType = sellType;
        sellNft.state = 1;
        sellNft.newestTime = block.timestamp;
        sellNft.timeLast = lastTime;

        AMarkets[nftId] = sellNft;

        IERC721(nftAddress).safeTransferFrom(_msgSender(), address(this), nftId);
        globalId ++;

        emit AuctionSell(_msgSender(),nftId,sellType,nftPrice,lastTime);
    }

    function cancelSell(uint256 nftId) external {
        require(_msgSender() == AMarkets[nftId].owner,"not NFT owner");
        require(AMarkets[nftId].state == 1,"not onsell");
        if(AMarkets[nftId].sellType==USE_MAIN){
            if(AMarkets[nftId].newestBuyer!=address(0)){
                payable(address(AMarkets[nftId].newestBuyer)).transfer(AMarkets[nftId].price);
            }
        }else{
            if(AMarkets[nftId].newestBuyer!=address(0)){
                (bool success,) = address(tokenAddress).call(abi.encodeWithSignature("transferFrom(address,address,uint256)",transitAddress,AMarkets[nftId].newestBuyer, AMarkets[nftId].price));
                require(success,"token transfer to buyer fail");
            }
        }
        IERC721(nftAddress).safeTransferFrom(address(this),_msgSender(),nftId);
        AMarkets[nftId].state = 2;
        emit AuctionCancelSell(_msgSender(),nftId);
    }

    function bid(uint256 nftId,uint256 bidPrice) external payable {
        require(AMarkets[nftId].state == 1,"not onsell");
        require(AMarkets[nftId].newestTime+AMarkets[nftId].timeLast>=block.timestamp,"cannot bid already");
        
        if(AMarkets[nftId].sellType==USE_MAIN){
            require(AMarkets[nftId].price+mainBidAdd<=msg.value,"too less value");
            payable(address(AMarkets[nftId].newestBuyer)).transfer(AMarkets[nftId].price);
            AMarkets[nftId].price = msg.value;
        }else{
            require(AMarkets[nftId].price+tokenBidAdd<=bidPrice,"too less value");
            (bool success,) = address(tokenAddress).call(abi.encodeWithSignature("transferFrom(address,address,uint256)",_msgSender(),transitAddress,bidPrice));
            require(success,"token transfer to transitAddress fail");

            if(AMarkets[nftId].newestBuyer!=address(0)){
                (success,) = address(tokenAddress).call(abi.encodeWithSignature("transferFrom(address,address,uint256)",transitAddress,AMarkets[nftId].newestBuyer,AMarkets[nftId].price));
                require(success,"token transfer to buyer fail");
            }
            
            // IERC20(tokenAddress).transferFrom(_msgSender(), transitAddress, bidPrice);
            // IERC20(tokenAddress).transferFrom(transitAddress,AMarkets[nftId].newestBuyer, AMarkets[nftId].price);
            AMarkets[nftId].price = bidPrice;
        }
        
        AMarkets[nftId].newestBuyer = _msgSender();
        AMarkets[nftId].newestTime = block.timestamp;

        if(AMarkets[nftId].sellType==USE_MAIN){
            emit AuctionBid(_msgSender(),nftId,USE_MAIN,msg.value,block.timestamp);
        }else{
            emit AuctionBid(_msgSender(),nftId,USE_USDT,bidPrice,block.timestamp);
        }
    }

    function claim(uint256 nftId) external {
        require(AMarkets[nftId].newestTime+AMarkets[nftId].timeLast<block.timestamp,"cannot claim now");
        require(AMarkets[nftId].newestBuyer == _msgSender(),"not the newest buyer");
        if(AMarkets[nftId].sellType==USE_MAIN){
            payable(address(AMarkets[nftId].owner)).transfer(AMarkets[nftId].price);
        }else{
            (bool success,) = address(tokenAddress).call(abi.encodeWithSignature("transferFrom(address,address,uint256)",_msgSender(),AMarkets[nftId].owner,AMarkets[nftId].price));
            require(success,"token transfer fail");
            // IERC20(tokenAddress).transferFrom(transitAddress,AMarkets[nftId].owner, AMarkets[nftId].price);
        }
        
        IERC721(nftAddress).safeTransferFrom(address(this),_msgSender(),nftId);
        AMarkets[nftId].state = 3;
        emit AuctionClaim(_msgSender(),nftId);
    }

    function retrieval(uint256 nftId) external {
        require(AMarkets[nftId].owner == _msgSender(),"not the seller");
        require(AMarkets[nftId].newestBuyer == address(0),"cannot retrieval now");
        require(AMarkets[nftId].newestTime+AMarkets[nftId].timeLast<block.timestamp,"cannot retrieval now");
        
        IERC721(nftAddress).safeTransferFrom(address(this),_msgSender(),nftId);
        AMarkets[nftId].state = 4;
        emit AuctionRetrieval(_msgSender(),nftId);
    }

    function onERC721Received(address, address, uint256, bytes calldata) external pure returns (bytes4) {
        return this.onERC721Received.selector;
    }

    receive() external payable {}
    fallback() external payable{}
}