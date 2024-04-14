# openoracle-configs
This repository is used by Node Operators to config and start operating for OpenOracle.
More details about OpenOracle can be found here: https://openlayer.gitbook.io/openlayer/openoracle

## Hardware Requirements
We recommend the following hardware for participating in our Holesky Testnet.
```
Operating System: linux amd x64
vCPUs: 2 Memory: 4GiB
Storage: 100GB
EC2 Equivalent: m5.medium
Required download bandwidth usage: 1 Mbps
Required upload bandwidth usage: 1 Mbps
Recommended download bandwidth usage: 8 Mbps
Recommended upload bandwidth usage: 8 Mbps
```

## Dependencies
Download and install docker per guide https://docs.docker.com/get-docker/

## Clone the repo
```
git clone https://github.com/0xJomo/openoracle-configs.git
cd openoracle-configs
```

## Generating keys

### 1. Generate BLS key
```
make generate-bls-key
```

BLS keys are located under ./keys/bls_key.

### 2. Import or create ECDSA key
If you already have your ecdsa key pair, import it to the same location, or anywhere in the project.

Alternatively, if you are starting your first operator, or do not want to reuse your existing operator, you can create a new ECDSA key pair with following command

```
make generate-ecdsa-key
```

Generated ECDSA keys are located under ./keys/ecdsa_key.

## Configure ENV
Update file `operator-configs/[NETWORK]/.env` and fill in the ENV variables

### 1. OPERATOR_ADDRESS
Make sure this matches your ECDSA key.

If you generated ecdsa key using the command above, find the address at `keys/ecdsa_key/keys/1.ecdsa.key.json`, look for `address` field.

### 2. BLS_PRIVATE_KEY_PATH
If you moved the generated bls key, edit and point it to the correct path

### 3. OPERATOR_BLS_KEY_PASSWORD
Find it at `keys/bls_key/password.txt`

### 4. ECDSA_PRIVATE_KEY_PATH
If you moved the generated ecdsa key, or importing your own ecdsa key, edit and point it to the correct path

### 5. OPERATOR_ECDSA_KEY_PASSWORD
Find it at `keys/ecdsa_key/password.txt`, or your own ecdsa key path. If you don't have password on the ecdsa key, leave it as empty string.

### 6. HTTP_RPC_URL and WS_RPC_URL
Put in your node RPC

## Fund ECDSA Wallet
Step 1: Follow the instructions in Obtaining Testnet ETH to fund a web3 wallet with HolEth.

https://docs.eigenlayer.xyz/restaking-guides/restaking-user-guide/stage-2-testnet/obtaining-testnet-eth-and-liquid-staking-tokens-lsts

Step 2: Send at least 0.1 Holesky ETH to the operator address. This ETH will be used to cover the gas cost for operator registration in the subsequent steps.


## Start opeartor

### 1. Register operator with Eigenlayer (If never registered with Eigenlayer before)
```
make holesky-register-operator-el
```

### 2. Register operator with OpenOracle (If first time operating for OpenOracle)
```
make holesky-register-operator-avs
```

### 3. Start operator
```
make holesky-start-operator
```

### (Alternative combining all 1,2,3 above) Register and start operator
```
make holesky-start-operator-all
```

## Upgrade opeartor
Step 1: Stop the operator
```
make holesky-stop-operator
```

or if you started with `make holesky-start-operator-all`
```
make holesky-stop-operator-all
```

Step 2: Pull latest repository
```
git pull
```

Step 3: Restart operator
```
make holesky-start-operator
```

## Update operator stake with OpenOracle
```
make holesky-update-operator
```

## All available commands
```
make help
```

```
generate-bls-key               generates bls key
generate-ecdsa-key             generates ecdsa key
generate-bls-key-arm           generates bls key on arm machines
generate-ecdsa-key-arm         generates ecdsa key on arm machines
holesky-start-operator         starts running the operator (Holesky)
holesky-stop-operator          stops operator (Holesky)
holesky-start-operator-all     registers and starts running the operator (Holesky)
holesky-stop-operator-all      stops operator - to be used when started using holesky-start-operator-all (Holesky)
holesky-register-operator-el   registers operator with eigenlayer (Holesky)
holesky-register-operator-avs  registers operator with OpenOracle (Holesky)
holesky-update-operator        updates operator stake with OpenOracle (Holesky)
```