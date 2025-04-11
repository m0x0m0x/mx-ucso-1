# Makefile for Foundry Project Automation

# Color Codes for Echo Output (works only if echoed through bash)
CYAN=\033[0;36m
PURPLE=\033[0;35m
RED=\033[0;31m
GREEN=\033[0;32m
NC=\033[0m

# RPCs and Keys
RPC_0=https://eth-sepolia.g.alchemy.com/v2/YfG5-esHajH3FpsLvC4eMFMEFYl9Lqcg
RPC_1=https://eth-holesky.g.alchemy.com/v2/YfG5-esHajH3FpsLvC4eMFMEFYl9Lqcg
KEY_0=0x3f03926cdb1f85a7b189060f53b0d055eb8c0cc9a838e929525eded8d7440dde
KEY_1=0x6ce075e337c519ed35567152183557bbfec6d8c33d480464539a1fa2fd53dc04
ETHERSCAN_API_KEY=2JEANQYC4C9S6PKDFWNGVT2UER24T32D2M

.DEFAULT_GOAL := help

help:
	@printf "\nAvailable commands:\n"
	@printf "  make foset       - Setup Foundry project + uv venv + slither (fish shell)\n"
	@printf "  make fo_only     - Setup only Foundry project\n"
	@printf "  make fo_test     - Run tests\n"
	@printf "  make fo_create   - Deploy contract with verification\n"
	@printf "  make fo_script   - Deploy contract using script\n"
	@printf "  make help        - Show this help menu\n"

# Project creation
foset:
	@printf "$$CYAN~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~$$NC\n"
	@printf "$$PURPLESetting up full Foundry + Slither project$$NC\n"
	@printf "$$CYAN~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~$$NC\n"
	@read -p "Enter the name of the project: " name; \
	if [ -z "$$name" ]; then \
		printf "$$RED BASTARD ! Project name cannot be empty $$NC\n"; \
		exit 1; \
	fi; \
	forge init --no-commit --no-git --force --vscode $$name && \
	cd $$name && \
	uv venv && fish -c 'source venv/bin/activate.fish; uv pip install slither-analyzer' && \
	solc-select install 0.8.13 && solc-select use 0.8.13;

fo_only:
	@printf "$$CYAN~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~$$NC\n"
	@printf "$$PURPLESetting up only Foundry project$$NC\n"
	@printf "$$CYAN~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~$$NC\n"
	@read -p "Enter the name of the project: " name; \
	if [ -z "$$name" ]; then \
		printf "$$RED BASTARD ! Project name cannot be empty $$NC\n"; \
		exit 1; \
	fi; \
	forge init --no-commit --no-git --force --vscode $$name

fo_test:
	@printf "$$CYAN~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~$$NC\n"
	@printf "$$PURPLERunning Foundry Tests$$NC\n"
	@printf "$$CYAN~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~$$NC\n"
	forge test

fo_create:
	@printf "$$CYAN~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~$$NC\n"
	@printf "$$PURPLEDeploying Contract with Verification$$NC\n"
	@printf "$$CYAN~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~$$NC\n"
	forge create src/Counter.sol:Counter \
	--rpc-url $$(RPC_1) \
	--private-key $$(KEY_1) \
	--etherscan-api-key $$(ETHERSCAN_API_KEY) \
	--verify --broadcast
	@printf "$$GREENSuccessfully deployed contract$$NC\n"

fo_script:
	@printf "$$CYAN~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~$$NC\n"
	@printf "$$PURPLERunning Foundry Script$$NC\n"
	@printf "$$CYAN~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~$$NC\n"
	forge script script/Counter.s.sol:CounterScript \
	--rpc-url $$(RPC_1) \
	--private-key $$(KEY_1) \
	--broadcast
	@printf "$$GREENSuccessfully deployed contract$$NC\n"

.PHONY: foset fo_only fo_test fo_create fo_script help
