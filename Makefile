BUILD_ID := $(shell git rev-parse --short HEAD 2>/dev/null || echo no-commit-id)

.DEFAULT_GOAL := help
help: ## Show available targets
	@cat Makefile* | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

clean: ## Clean the project
	rm -rf ./target

#deps:
#	cargo install

build: ## Build the project
	cargo build

run: ## Build and run the project
	cargo run