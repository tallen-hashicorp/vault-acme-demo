#!/bin/bash
export HC_LEARN_LAB=$PWD
docker network create \
    --driver=bridge \
    --subnet=10.1.1.0/24 \
    learn-vault

docker pull caddy:2.6.4