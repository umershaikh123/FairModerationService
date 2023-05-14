//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

// Useful for debugging. Remove when deploying to a live network.
import "hardhat/console.sol";

// Use openzeppelin to inherit battle-tested implementations (ERC20, ERC721, etc)
// import "@openzeppelin/contracts/access/Ownable.sol";

contract FMS {
  struct Post {
    address postedBy;
    bytes32 ipfsCID;
    uint postID;
  }

  struct User {
    address addr;
    string name;
    int reputation;
    uint256 noOfPosts;
  }

  User[] public user_array;
  mapping(address => uint) public user_tokens;
  mapping(address => User) public getUser;
  mapping(address => Post[]) public user_posts;
  mapping(uint => Post) public post;

  modifier userCreated() {
    User memory _user = getUser[msg.sender];

    require(msg.sender != _user.addr, "User has been already created");
    _;
  }

  function _createUser(string memory _username) internal {
    //require() check if user already exists
    ////require() check if username already exists
    User storage newUser = User(msg.sender, _username, 0, 0);
    //emit event
  }

  function getUser() public view returns (User memory) {
    return user[msg.sender];
  }

  //create post on the front end then call upkeep then call this function
  function createPost(bytes32 ipfsCID) public {
    require(bytes(users[msg.sender]).length > 0, "User not registered");

    posts.push(Post(msg.sender, ipfsCID));
  }

  function getUserPosts(uint256 postId) public view returns (Post memory) {
    return user_posts[msg.sender];
  }

  function getPost(uint256 postId) public view returns (Post memory) {
    return post[postId];
  }
}
