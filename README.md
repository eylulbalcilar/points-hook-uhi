# Points Hook - Uniswap v4

A Uniswap v4 hook that rewards swappers with ERC-1155 points tokens when buying TOKEN with ETH.

## Overview

This hook attaches to ETH-TOKEN pools and issues POINTS tokens to users who swap ETH for TOKEN. Users receive points equal to 20% of the ETH amount spent.

## How It Works

- Hook activates on `afterSwap`
- Checks if the pool is an ETH-TOKEN pool
- Checks if the swap direction is ETH to TOKEN (zeroForOne)
- Mints ERC-1155 POINTS tokens equal to 20% of ETH spent
- User address is passed via `hookData`

## Setup

```bash
forge install
forge build
```

## Test

```bash
forge test
```

## Deploy

```bash
cp .env.example .env
# Fill in your PRIVATE_KEY, SEPOLIA_RPC_URL, ETHERSCAN_API_KEY
forge script script/DeployHook.s.sol --rpc-url $SEPOLIA_RPC_URL --chain-id 11155111 --broadcast
```

## Deployment

Deployed to Sepolia testnet:
- Transaction: `0x1ed88151bb665905cee46d3cfbe4496b1ec02fe563191b9a1213ae785ccae4ec`

## Built With

- Uniswap v4 Hook Architecture
- Foundry
- Solidity 0.8.26
- ERC-1155

## Part of

UHI9 - Uniswap Hook Incubator Cohort 9
