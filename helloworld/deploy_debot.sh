
#!/bin/bash

LOCALNET=http://127.0.0.1
DEVNET=https://net.ton.dev
MAINNET=https://main.ton.dev
NETWORK=$DEVNET

# NETWORK=$(./configes/get_network.sh)
# CONTRACTS=$(./configes/get_contracts.sh)
# TVM_LINKER=$(./configes/get_tvm_linker.sh)
TONOS_CLI=tonos-cli
# CURRENT_DIR=$(./configes/get_current_dir.sh)

DEBOT_NAME=helloDebot

tondev sol compile $DEBOT_NAME.sol

ADDR=$(tonos-cli genaddr $DEBOT_NAME.tvc $DEBOT_NAME.abi.json --genkey $DEBOT_NAME.keys.json| grep "Raw address:" | cut -c 14-)

DEBOT_ABI=$(cat $DEBOT_NAME.abi.json | xxd -ps -c 20000)


ICON_BYTES=$(base64 -w 0 hellodebot.png)
ICON=$(echo -n "data:image/png;base64,$ICON_BYTES" | xxd -ps -c 20000)

echo Waiting. Transaction from Giver...

if [ $NETWORK = "http://127.0.0.1" ]
then
    GIVER_RESULT=$($TONOS_CLI -u $NETWORK call 0:841288ed3b55d9cdafa806807f02a0ae0c169aa5edfe88a789a6482429756a94 sendGrams "{\"dest\":\"$ADDR\",\"amount\":\"100000000000\"}" --abi ./local_giver.abi.json | grep "Succeeded" | cut -c 1-)
elif [ $NETWORK = "https://net.ton.dev" ]
then
    GIVER_RESULT=$($TONOS_CLI -u $NETWORK call 0:ed069a52b79f0bc21d13da9762a591e957ade1890d4a1c355e0010a8cb291ae4 pay '{"addr":"'$ADDR'","count":"'111000000000'"}' --abi ./giver.abi.json  | grep "Succeeded" | cut -c 1-)
fi

echo Result transaction from Giver: $GIVER_RESULT

tonos-cli deploy $DEBOT_NAME.tvc {} --sign $DEBOT_NAME.keys.json --abi $DEBOT_NAME.abi.json

ICON_BYTES=$(base64 -w 0 hellodebot.png)
ICON=$(echo -n "data:image/png;base64,$ICON_BYTES" | xxd -ps -c 20000)

tonos-cli --url $NETWORK call $ADDR setIcon "{\"icon\":\"$ICON\"}" --sign $DEBOT_NAME.keys.json --abi $DEBOT_NAME.abi.json

tonos-cli call $ADDR setABI "{\"dabi\":\"$DEBOT_ABI\"}" --sign $DEBOT_NAME.keys.json --abi $DEBOT_NAME.abi.json

tonos-cli debot fetch $ADDR #0:70c574218d4c78ef044c02cd14a7617693deae2e051c2269b46ea65a68817c2a



# function get_address {
# echo $(cat log.log | grep "Raw address:" | cut -d ' ' -f 3)
# }
# function genaddr {
# tonos-cli genaddr $1.tvc $1.abi.json --genkey $1.keys.json > log.log
# }

# LOCALNET=http://127.0.0.1
# DEVNET=https://net.ton.dev
# MAINNET=https://main.ton.dev
# NETWORK=$DEVNET

# echo GENADDR DEBOT
# genaddr $DEBOT_NAME
# DEBOT_ADDRESS=$(get_address)

# echo ASK GIVER
# giver $DEBOT_ADDRESS
# DEBOT_ABI=$(cat $DEBOT_NAME.abi.json | xxd -ps -c 20000)
# ICON_BYTES=$(base64 -w 0 hellodebot.png)
# ICON=$(echo -n "data:image/png;base64,$ICON_BYTES" | xxd -ps -c 20000)

# echo DEPLOY DEBOT $DEBOT_ADDRESS
# tonos-cli --url $NETWORK deploy $DEBOT_NAME.tvc "{}" --sign $DEBOT_NAME.keys.json --abi $DEBOT_NAME.abi.json
# tonos-cli --url $NETWORK call $DEBOT_ADDRESS setABI "{\"dabi\":\"$DEBOT_ABI\"}" --sign $DEBOT_NAME.keys.json --abi $DEBOT_NAME.abi.json
# tonos-cli --url $NETWORK call $DEBOT_ADDRESS setIcon "{\"icon\":\"$ICON\"}" --sign $DEBOT_NAME.keys.json --abi $DEBOT_NAME.abi.json

# echo DONE
# echo $DEBOT_ADDRESS > address.log
# echo debot $DEBOT_ADDRESS