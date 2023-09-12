#!/bin/bash
docker rm -v --force learn-vault
docker rm -v --force caddy-server
docker network rm learn-vault
rm -r caddy_data/caddy