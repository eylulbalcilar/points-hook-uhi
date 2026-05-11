// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Script} from "forge-std/Script.sol";
import {IPoolManager} from "v4-core/interfaces/IPoolManager.sol";
import {Hooks} from "v4-core/libraries/Hooks.sol";
import {HookMiner} from "v4-hooks-public/src/utils/HookMiner.sol";
import {PointsHook} from "../src/PointsHook.sol";

contract DeployHook is Script {
    address constant POOL_MANAGER = 0x000000000004444c5dc75cB358380D2e3dE08A90;

    function run() external {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");

        uint160 flags = uint160(Hooks.AFTER_SWAP_FLAG);

        (address hookAddress, bytes32 salt) = HookMiner.find(
            0x4e59b44847b379578588920cA78FbF26c0B4956C,
            flags,
            type(PointsHook).creationCode,
            abi.encode(IPoolManager(POOL_MANAGER))
        );

        vm.startBroadcast(privateKey);
        PointsHook hook = new PointsHook{salt: salt}(IPoolManager(POOL_MANAGER));
        require(address(hook) == hookAddress, "hook address mismatch");
        vm.stopBroadcast();
    }
}
