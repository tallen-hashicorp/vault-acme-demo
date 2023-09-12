# vault-acme-demo
A simple ACME Demo taken from the [Enable ACME with PKI secrets engine](https://developer.hashicorp.com/vault/tutorials/new-release/pki-acme-caddy#deploy-http-caddy-container) tutoiral

## Challenge

Provisioning and maintaining TLS certificate lifecycle for a large number of use cases presents a considerable operational burden. Manually maintaining certificate lifecycle also introduces issues which can result in downtime if certificates are not properly provisioned or renewed on time.

## Solution

Starting with version 1.14.0, the Vault [PKI secrets engine](https://developer.hashicorp.com/vault/api-docs/secret/pki#acme-certificate-issuance) supports the [Automatic Certificate Management Environment (ACME)](https://datatracker.ietf.org/doc/html/rfc8555) specification for issuing and renewing leaf server certificates.

You can use ACME-compliant clients with Vault to help automate the leaf server certificate lifecycle.

The hands-on lab scenario presented here uses the [Caddy](https://caddyserver.com/) web server's automatic HTTPS functionality with Vault as its ACME server.

## Running Demo from scratch
```bash
sh 01-hands-on-lab.sh
```