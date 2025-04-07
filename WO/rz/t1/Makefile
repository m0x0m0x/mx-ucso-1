# Rust project Makefile with colors and help

# Colors
YELLOW  := \033[1;33m
GREEN   := \033[1;32m
CYAN    := \033[1;36m
RESET   := \033[0m

# Default target
.DEFAULT_GOAL := help

## build            🛠️  Build the project
build:
	cargo build

## run              🚀 Run the project
run:
	cargo run

## release          🏗️  Build release binary
release:
	cargo build --release

## test             🧪 Run tests
test:
	cargo test

## clean            🧹 Remove target directory
clean:
	cargo clean

## fmt              🎨 Format the code
fmt:
	cargo fmt

## clippy           🔍 Lint using clippy
clippy:
	cargo clippy --all-targets --all-features -- -D warnings

## help             📖 Show this help message
help:
	@echo -e "$(CYAN)Available commands:$(RESET)\n"
	@awk 'BEGIN {FS = ":.*##"; printf ""} /^[a-zA-Z_-]+:.*##/ { printf "  $(YELLOW)%-15s$(RESET) %s\n", $$1, $$2 }' $(MAKEFILE_LIST)
