FROM gradle:8.10.2 AS builder
WORKDIR /app
COPY . .

# hadolint ignore=DL3008
RUN apt-get update && \
    apt-get install --no-install-recommends -y make && \
    rm -rf /var/lib/apt/lists/*

RUN make build

CMD ["make", "run"]
