############################# HELP MESSAGE #############################
# Make sure the help command stays first, so that it's printed by default when `make` is called without arguments
.PHONY: help tests
help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

generate-keys: ## generates bls and ecdsa keys
	./keys/egnkey-linux generate --key-type bls --num-keys 1 --output-dir keys/bls_key
	./keys/egnkey-linux generate --key-type ecdsa --num-keys 1 --output-dir keys/ecdsa_key

docker-start-local: ## starts operator docker containers
	docker pull gcr.io/openoracle-de73b/operator:latest && docker compose -f operator-configs/local/docker-compose.yml up

docker-start-holesky: ## starts operator docker containers
	docker pull gcr.io/openoracle-de73b/operator:latest && docker compose -f operator-configs/holesky/docker-compose.yml up -d

docker-stop-holesky: ## stops operator docker containers
	docker compose -f operator-configs/holesky/docker-compose.yml down