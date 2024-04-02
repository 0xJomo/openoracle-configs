# openoracle-configs

## Dependencies
Download and install docker per guide https://docs.docker.com/get-docker/

## Generating bls and ecdsa keys

Follow https://github.com/Layr-Labs/eigensdk-go/tree/master/cmd/egnkey to generate your own bls and ecdsa key


## Running command
Update command docker-compose.yml to include operator address and path to your bls and ecdsa key 

```
--config config-files/operator-docker-compose.yaml --operator-address [Your operator address] [local bls key path] --ecdsa-private-key [local ecdsa key path]
```

## Starting opeartor via make
make docker-start-everything
