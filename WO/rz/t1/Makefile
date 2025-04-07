# Default goal
.DEFAULT_GOAL := help

# Color definitions (ANSI escape codes)
YELLOW := \033[1;33m
CYAN   := \033[1;36m
RESET  := \033[0m

## build            🛠️  Build the Rust project
build:
	cargo build

## run              🚀 Run the Rust binary
run:
	cargo run

## release          📦 Build release binary
release:
	cargo build --release

## test             🧪 Run tests
test:
	cargo test

## fmt              🎨 Format code using rustfmt
fmt:
	cargo fmt

## clippy           🔍 Run clippy linter
clippy:
	cargo clippy --all-targets --all-features -- -D warnings

## clean            🧹 Clean the target directory
clean:
	cargo clean

## help             📖 Show this help message
help:
	@printf "$(CYAN)Available commands:$(RESET)\n\n"
	@awk 'BEGIN {FS = ":.*##"; OFS = ""} \
		/^[a-zA-Z0-9_-]+:.*##/ { \
			printf "  $(YELLOW)%-15s$(RESET) %s\n", $$1, $$2 \
		}' $(MAKEFILE_LIST)
