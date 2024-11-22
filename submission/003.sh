#!/bin/sh
# How many new outputs were created by block 123,456?
bitcoin-cli -rpcconnect=84.247.182.145 -rpcuser=user_095 -rpcpassword=X19iRP1wRyAx  getblockstats 123456 | jq --raw-output .utxo_increase
