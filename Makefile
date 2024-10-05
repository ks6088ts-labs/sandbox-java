# Git
GIT_REVISION ?= $(shell git rev-parse --short HEAD)
GIT_TAG ?= $(shell git describe --tags --abbrev=0 --always | sed -e s/v//g)

# Docker
DOCKER_REPO_NAME ?= ks6088ts
DOCKER_IMAGE_NAME ?= template-go
DOCKER_COMMAND ?=

# Tools
TRIVY_VERSION ?= 0.55.2

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.DEFAULT_GOAL := help

.PHONY: install-deps-dev
install-deps-dev: ## install dependencies for development
	@which gradle || echo "Install Gradle Build Tool: https://gradle.org/install/"
	@which java || echo "Install JDK: https://www.oracle.com/java/technologies/downloads/"

.PHONY: format-check
format-check: ## format check
	@echo "Yet to be implemented"

.PHONY: format
format: ## format code
	@echo "Yet to be implemented"

.PHONY: lint
lint: ## lint
	@echo "Yet to be implemented"

.PHONY: test
test: ## run tests
	./gradlew test

.PHONY: build
build: ## build applications
	./gradlew build

.PHONY: ci-test
ci-test: install-deps-dev format-check lint test build ## run CI test

.PHONY: run
run: ## run application
	./gradlew run

# ---
# Docker
# ---

.PHONY: docker-build
docker-build: ## build Docker image
	docker build \
		-t $(DOCKER_REPO_NAME)/$(DOCKER_IMAGE_NAME):$(GIT_TAG) \
		--build-arg GIT_REVISION=$(GIT_REVISION) \
		--build-arg GIT_TAG=$(GIT_TAG) \
		.

.PHONY: docker-run
docker-run: ## run Docker container
	docker run --rm $(DOCKER_REPO_NAME)/$(DOCKER_IMAGE_NAME):$(GIT_TAG) $(DOCKER_COMMAND)

.PHONY: docker-lint
docker-lint: ## lint Dockerfile
	docker run --rm -i hadolint/hadolint < Dockerfile

.PHONY: docker-scan
docker-scan: ## scan Docker image
	trivy image $(DOCKER_REPO_NAME)/$(DOCKER_IMAGE_NAME):$(GIT_TAG)

.PHONY: ci-test-docker
ci-test-docker: install-deps-dev docker-lint docker-build docker-scan docker-run ## run CI test for Docker
