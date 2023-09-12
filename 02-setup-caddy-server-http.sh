#!/bin/bash

export HC_LEARN_LAB=$PWD

docker run \
    --name caddy-server \
    --hostname caddy-server \
    --network learn-vault \
    --ip 10.1.1.200 \
    --publish 80:80 \
    --volume "$HC_LEARN_LAB"/index.html:/usr/share/caddy/index.html \
    --volume "$HC_LEARN_LAB"/caddy_data:/data \
    --detach \
    --rm \
    caddy

docker ps -f name=caddy-server --format "table {{.Names}}\t{{.Status}}"

curl http://localhost/
curl https://localhost/