// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import { Script } from "forge-std/Script.sol";

contract HelperConfig is Script {
  //if on local anvil deploy mocks
  //otherwise grab existing addresses from live networks
  NetworkConfig public activeNetworkConfig;

  struct NetworkConfig {
    address priceFeed; //eth/usd price feed address
  }

  constructor() {
    if (block.chainid == 11155111) {
      activeNetworkConfig = getSepoliaEthConfig();
    } else if (block.chainid == 1) {
      activeNetworkConfig = getMainnetEthConfig();
    } else {
      activeNetworkConfig = getAnvilEthConfig();
    }
  }

  function getSepoliaEthConfig() public pure returns (NetworkConfig memory) {
    // price feed address
    NetworkConfig memory sepoliaConfig = NetworkConfig({
      priceFeed: 0x694AA1769357215DE4FAC081bf1f309aDC325306
    });
    return sepoliaConfig;
  }

    function getMainnetEthConfig() public pure returns (NetworkConfig memory) {
    // price feed address
    NetworkConfig memory ethConfig = NetworkConfig({
      priceFeed: 0xCfE54B5cD566aB89272946F602D76Ea879CAb4a8
    });
    return ethConfig;
  }

  function getAnvilEthConfig() public returns (NetworkConfig memory) {
    // price feed address

    // 1. Deploy the mocks
    // 2. Return the mock address

    vm.startBroadcast();
    
    vm.stopBroadcast();
  }
}