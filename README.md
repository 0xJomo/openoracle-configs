# openoracle-configs

## Dependencies
Download and install docker per guide https://docs.docker.com/get-docker/

## Generating bls and ecdsa keys

```
make generate-keys
```
Run the command to generate bls and ecdsa keys for your operator

## Configure docker file
Update command docker-compose.yml to include operator address and path to your bls and ecdsa key 

```
--config config-files/operator-docker-compose.yaml --operator-address [Your operator address] --bls-private-key keys/bls_key/keys/1.bls.key.json --ecdsa-private-key keys/ecdsa_key/keys/1.ecdsa.key.json

```

Note that bls and ecdsa private key paths are already configured with the defualt path in "Generating bls and ecdsa keys". 


## Starting opeartor via make
make docker-start-everything
