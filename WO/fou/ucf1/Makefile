# Colors (only used for echo output)
RED=\033[0;31m
GREEN=\033[0;32m
CYAN=\033[0;36m
PURPLE=\033[0;35m
NC=\033[0m

# Global vars
RPC_0=https://eth-sepolia.g.alchemy.com/v2/YfG5-esHajH3FpsLvC4eMFMEFYl9Lqcg
RPC_1=https://eth-holesky.g.alchemy.com/v2/YfG5-esHajH3FpsLvC4eMFMEFYl9Lqcg

KEY_0=0x3f03926cdb1f85a7b189060f53b0d055eb8c0cc9a838e929525eded8d7440dde
KEY_1=0x6ce075e337c519ed35567152183557bbfec6d8c33d480464539a1fa2fd53dc04

ETHERSCAN_API_KEY=2JEANQYC4C9S6PKDFWNGVT2UER24T32D2M

# Prompt-based commands aren't great in makefiles, so use env var
PROJECT ?= my_foundry_project

##~~~~~~~~~~~~ TARGETS ~~~~~~~~~~~~##

init:
	@echo "$(CYAN)Creating Foundry project: $(PROJECT)$(NC)"
	forge init --no-commit --no-git --force --vscode $(PROJECT)
	cd $(PROJECT) && uv venv && source venv/bin/activate.fish && \
	uv pip install slither-analyzer && \
	solc-select install 0.8.13 && solc-select use 0.8.13

foundry-only:
	@echo "$(CYAN)Creating Foundry-only project: $(PROJECT)$(NC)"
	forge init --no-commit --no-git --force --vscode $(PROJECT)

test:
	@echo "$(CYAN)Running tests...$(NC)"
	forge test

deploy:
	@echo "$(CYAN)Deploying contract with verification...$(NC)"
	forge create src/Counter.sol:Counter \
		--rpc-url $(RPC_1) \
		--private-key $(KEY_1) \
		--etherscan-api-key $(ETHERSCAN_API_KEY) \
		--verify --broadcast

script:
	@echo "$(CYAN)Running deploy script...$(NC)"
	forge script script/Counter.s.sol:CounterScript \
		--rpc-url $(RPC_1) \
		--private-key $(KEY_1) \
		--broadcast

