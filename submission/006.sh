#!/bin/sh
# Which tx in block 257,343 spends the coinbase output of block 256,128?
blockhash1=$(bitcoin-cli getblockhash 256128)
GetFirstBlock=$(bitcoin-cli getblock $blockhash1 | jq -r .tx[0])
blockhas2=$(bitcoin-cli getblockhash 257343 )
GetSecondBlock=$(bitcoin-cli getblock $blockhas2 2 | jq --arg GetFirstBlock "$GetFirstBlock" '.tx[] | select(.vin[]?.txid == $GetFirstBlock)')
echo $GetSecondBlock| jq -r .txid





#GeTransaction=$(bitcoin-cli getrawtransaction $GetFirstBlock)
#CHOSEN_ONE=$(bitcoin-cli decoderawtransaction $GeTransaction| jq .vout[].scriptPubKey.address)

#bitcoin-cli getblockhash 257343
#bitcoin-cli getblock 0000000000000004f3fb306baa0638ffc181bc6b9752f9325612559c04d57bf9
#bitcoin-cli getrawtransaction 90d10b04417f2698fa8fed92ca5c951d26613a1737da69a7450f8c7706ba8783k
#bitcoin-cli decoderawtransaction 01000000010000000000000000000000000000000000000000000000000000000000000000ffffffff50033fed03062f503253482f048191305208705c004c0000285c36522cfabe6d6d415c0163a1bcecbf15ac152630ca5e59eb170f199e2a7ce418ab6eac162162c9040000000000000067686173682e696f0000000001a01e2995000000001976a91480ad90d403581fa3bf46086a91b2d9d4125db6c188ac00000000
#adress=1CjPR7Z5ZSyWk6WtXvSFgkptmpoi4UM9BC



#bitcoin-cli getblockhash 256128
#bitcoin-cli getblock 0000000000000007440fc4df4d953acbf67ad26adb2d7dff7bee90318b41e6c6




