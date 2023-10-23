pragma solidity 0.8.13;

import {ERC721, ERC721TokenReceiver} from "./ERC721.sol";

abstract contract Base {
  uint32 public startTime = uint32(uint256(4831838208)); // Default to 100 years later
  address[] public registered;
  mapping(address => bool) public uniqueCheck;

  function _checkRegistrant(address registrant) virtual internal;
  function _register(address registrant) virtual internal;
  function _batchRegister(address[] calldata registrants) virtual internal;
}

abstract contract RegisterModule is Base {
  function register(address registrant) external {
    _checkRegistrant(registrant);
    _register(registrant);
  } 

  function batchRegister(address[] calldata registrants) external {
    for (uint256 i = 0; i < registrants.length; i++)
      _checkRegistrant(registrants[i]);

    _batchRegister(registrants);
  }
}

abstract contract NFTModule is Base, ERC721 {
  constructor(string memory name, string memory symbol) ERC721(name, symbol) {}

  function mint() public {
    require(block.timestamp >= startTime, "Mint not allowed");

    uint256 idx = registered.length;
    while (idx > 0) {
      idx--;
      _safeMint(registered[idx], idx);
    }
  }
}

contract Core is Base {
  function _checkRegistrant(address registrant) override internal {
    require(!uniqueCheck[registrant], "Duplicate registrant");
    uniqueCheck[registrant] = true;

    if (registrant.code.length > 0) {
      // EIP 165
      (bool success, bytes memory data) = 
        registrant.staticcall(
          abi.encodeWithSignature("supportsInterface(bytes4)", ERC721TokenReceiver.onERC721Received.selector)
        );
      require(success, "Staticcall failed");

      bool isSupported = abi.decode(data, (bool));
      require(isSupported, "Registrant must support ERC721TokenReceiver");
    }
  }

  function _register(address registrant) override internal {
    registered.push(registrant);
  }

  function _batchRegister(address[] memory registrants) override internal {
    for (uint256 i = 0; i < registrants.length; i++) {
      registered.push(registrants[i]);
    }
  }
}

contract SoulBound is NFTModule("SoulBound", "SoulBound"), RegisterModule, Core {
  address immutable public owner = msg.sender;

  function transferFrom(address from, address to, uint256 id) public override {
    revert("Transfer not allowed");
  }

  function tokenURI(uint256 id) public view override returns (string memory) {
    return "";
  }

  function updateStartTime(uint32 newStartTime) public {
    require(msg.sender == owner, "Only owner");

    startTime = newStartTime;
  }
}
