#!/bin/bash

export HC_LEARN_LAB=$PWD

docker rm -v --force caddy-server

docker run \
    --name caddy-server \
    --hostname caddy-server \
    --network learn-vault \
    --ip 10.1.1.200 \
    --publish 443:443 \
    --volume "$HC_LEARN_LAB"/caddy_config/Caddyfile:/etc/caddy/Caddyfile \
    --volume "$HC_LEARN_LAB"/index.html:/usr/share/caddy/index.html \
    --volume "$HC_LEARN_LAB"/caddy_data:/data \
    --detach \
    --rm \
    caddy

sleep 3 

docker ps -f name=caddy-server --format "table {{.Names}}\t{{.Status}}"

docker logs caddy-server

curl \
    --cacert "$HC_LEARN_LAB"/root_2023_ca.crt \
    --resolve caddy-server:443:127.0.0.1 \
    https://caddy-server

