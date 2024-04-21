############################# HELP MESSAGE #############################
# Make sure the help command stays first, so that it's printed by default when `make` is called without arguments
.PHONY: help tests
help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

generate-bls-key: ## generates bls key
	./keys/egnkey-linux generate --key-type bls --num-keys 1 --output-dir keys/bls_key

generate-ecdsa-key: ## generates ecdsa key
	./keys/egnkey-linux generate --key-type ecdsa --num-keys 1 --output-dir keys/ecdsa_key

generate-bls-key-arm: ## generates bls key on arm machines
	./keys/egnkey generate --key-type bls --num-keys 1 --output-dir keys/bls_key

generate-ecdsa-key-arm: ## generates ecdsa key on arm machines
	./keys/egnkey generate --key-type ecdsa --num-keys 1 --output-dir keys/ecdsa_key

# Holesky commands

holesky-start-operator: ## starts running the operator (Holesky)
	docker pull gcr.io/openoracle-de73b/operator:latest && docker compose -f operator-configs/holesky/start-operator.yml up -d

holesky-stop-operator: ## stops operator (Holesky)
	docker compose -f operator-configs/holesky/start-operator.yml down

holesky-start-operator-all: ## registers and starts running the operator (Holesky)
	docker pull gcr.io/openoracle-de73b/operator:latest && docker compose -f operator-configs/holesky/start-operator-all.yml up -d

holesky-stop-operator-all: ## stops operator - to be used when started using holesky-start-operator-all (Holesky)
	docker compose -f operator-configs/holesky/start-operator-all.yml down

holesky-register-operator-el: ## registers operator with eigenlayer (Holesky)
	docker pull gcr.io/openoracle-de73b/operator:latest && docker compose -f operator-configs/holesky/register-operator-el.yml up

holesky-register-operator-avs: ## registers operator with OpenOracle (Holesky)
	docker pull gcr.io/openoracle-de73b/operator:latest && docker compose -f operator-configs/holesky/register-operator-avs.yml up

holesky-update-operator: ## updates operator stake with OpenOracle (Holesky)
	docker pull gcr.io/openoracle-de73b/operator:latest && docker compose -f operator-configs/holesky/update-operator.yml up

start-monitoring: ## start prometheus and grafana monitoring for operators
	docker compose -f monitoring/start-monitoring.yml up -d