#!/bin/bash
docker pull hashicorp/vault:latest

docker run \
      --name=learn-vault \
      --hostname=learn-vault \
      --network=learn-vault \
      --add-host caddy-server.learn.internal:10.1.1.200 \
      --ip 10.1.1.100 \
      --publish 8200:8200 \
      --env VAULT_ADDR="http://localhost:8200" \
      --env VAULT_CLUSTER_ADDR="http://learn-vault:8201" \
      --env VAULT_API_ADDR="http://learn-vault:8200" \
      --cap-add=IPC_LOCK \
      --detach \
      --rm \
      hashicorp/vault vault server -dev -dev-listen-address 0.0.0.0:8200 -dev-root-token-id root

docker ps -f name=learn-vault --format "table {{.Names}}\t{{.Status}}"

sleep 3

export VAULT_ADDR=http://127.0.0.1:8200
vault status
vault login -no-print root