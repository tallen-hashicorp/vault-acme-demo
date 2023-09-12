#!/bin/bash

export VAULT_ADDR=http://127.0.0.1:8200
vault login -no-print root

vault read pki_int/config/cluster

vault secrets tune \
      -passthrough-request-headers=If-Modified-Since \
      -allowed-response-headers=Last-Modified \
      -allowed-response-headers=Location \
      -allowed-response-headers=Replay-Nonce \
      -allowed-response-headers=Link \
      pki_int

vault write pki_int/config/acme enabled=true