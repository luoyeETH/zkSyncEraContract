// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Factory {
    mapping(address => address[]) internal contracts;

    constructor() {}

    function createContracts(uint256 numContracts) external {
        for (uint256 i = 0; i < numContracts; i++) {
            DummyContract newContract = new DummyContract();
            contracts[msg.sender].push(address(newContract));
        }
    }
    function getCount(address _addr) view external returns (uint) {
        return contracts[_addr].length;
    }

    function getContracts(address _addr) view external returns (address[] memory subContracts){
        return subContracts = contracts[_addr];
    }
}

contract DummyContract {
    constructor() {}

    function execute() external {
    }
}
