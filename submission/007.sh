#!/bin/sh
# Only one single output remains unspent from block 123,321. What address was it sent to?
GetBlockTxid=$(bitcoin-cli getblock $(bitcoin-cli getblockhash  123321) 2 | jq  --raw-output .tx[].txid)

for txid in $GetBlockTxid
do
    OUT=$(bitcoin-cli getrawtransaction $txid true | jq '.vout | length')
    for index in $(seq 0 $(($OUT-1)) )
    do
        echo $(bitcoin-cli gettxout $txid $index | jq -r '.scriptPubKey.address' )
    done
done