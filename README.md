# openoracle-configs

## Dependencies
Download and install docker per guide https://docs.docker.com/get-docker/

## Generating bls and ecdsa keys

You can set up the keys with your own password following this guide: https://docs.eigenlayer.xyz/eigenlayer/operator-guides/operator-installation#create-keys

Alertnatively, you can just run the command to generate bls and ecdsa keys for your operator

```
make generate-keys
```

BLS keys are located under ./keys/bls_key.

ECDSA keys are located under ./keys/ecdsa_key.

You can remove the passwords files and protect the generated passwords accordingly.


## Configure docker file
Update command docker-compose.yml to include operator address and path to your bls and ecdsa key 

```
--config config-files/operator-docker-compose.yaml --operator-address [Update with generated keys/ecdsa_key/private_key_hex] --bls-private-key keys/bls_key/keys/1.bls.key.json --ecdsa-private-key keys/ecdsa_key/keys/1.ecdsa.key.json
```

Update your bls and ecdsa key password 

```
environment:
    OPERATOR_BLS_KEY_PASSWORD: "[Update with generated password from ./keys/bls_key/password.txt]"
    OPERATOR_ECDSA_KEY_PASSWORD: "[Update with generated password from ./keys/ecdsa_key/password.txt]"
```

Note that bls and ecdsa private key paths are already configured with the defualt path in "Generating bls and ecdsa keys". 

## Fund ECDSA Wallet
Step 1: Follow the instructions in Obtaining Testnet ETH to fund a web3 wallet with HolEth.

https://docs.eigenlayer.xyz/restaking-guides/restaking-user-guide/stage-2-testnet/obtaining-testnet-eth-and-liquid-staking-tokens-lsts

Step 2: Send at least 1 Holesky ETH to the operator address. This ETH will be used to cover the gas cost for operator registration in the subsequent steps.


## Starting opeartor via make
make docker-start-everything
