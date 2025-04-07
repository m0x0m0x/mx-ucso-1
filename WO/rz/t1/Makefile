.DEFAULT_GOAL := help

YELLOW := \033[1;33m
CYAN   := \033[1;36m
RESET  := \033[0m

## build            Build the project
build:
	cargo build

## help             Show help
help:
	@printf "$(CYAN)Available commands:$(RESET)\n\n"
	@awk 'BEGIN {FS = ":.*##"; OFS = ""} \
		/^[a-zA-Z0-9_-]+:.*##/ { \
			printf "  $(YELLOW)%-15s$(RESET) %s\n", $$1, $$2 \
		}' $(MAKEFILE_LIST)
