#!/bin/bash

# Solicitando e exportando chaves de acesso
read -sp "Digite sua AWS_ACCESS_KEY_ID: " AWS_ACCESS_KEY_ID
export AWS_ACCESS_KEY_ID="$AWS_ACCESS_KEY_ID"
read -sp "/nDigite sua AWS_SECRET_ACCESS_KEY: " AWS_SECRET_ACCESS_KEY
export AWS_SECRET_ACCESS_KEY="$AWS_SECRET_ACCESS_KEY"
read -sp "/nDigite sua AWS_SESSION_TOKEN: " AWS_SESSION_TOKEN
export AWS_SESSION_TOKEN="$AWS_SESSION_TOKEN"