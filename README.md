[![test](https://github.com/ks6088ts-labs/sandbox-java/actions/workflows/test.yaml/badge.svg?branch=main)](https://github.com/ks6088ts-labs/sandbox-java/actions/workflows/test.yaml?query=branch%3Amain)
[![docker](https://github.com/ks6088ts-labs/sandbox-java/actions/workflows/docker.yaml/badge.svg?branch=main)](https://github.com/ks6088ts-labs/sandbox-java/actions/workflows/docker.yaml?query=branch%3Amain)
[![ghcr-release](https://github.com/ks6088ts-labs/sandbox-java/actions/workflows/ghcr-release.yaml/badge.svg)](https://github.com/ks6088ts-labs/sandbox-java/actions/workflows/ghcr-release.yaml)

# sandbox-java

A sandbox for Java

## Prerequisites

- [JDK 21+](https://www.oracle.com/java/technologies/downloads/)
- [GNU Make](https://www.gnu.org/software/make/)

## Development instructions

### Local development

Use Makefile to run the project locally.

```shell
# help
make

# install dependencies for development
make install-deps-dev

# run tests
make test

# build applications
make build

# run CI tests
make ci-test
```

### Docker development

```shell
# build docker image
make docker-build

# run docker container
make docker-run

# run CI tests in docker container
make ci-test-docker
```
