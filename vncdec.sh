#!/bin/bash


while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -v|--value)
    VALUE="$2"
    shift 
    shift 
    ;;
    *)    
    echo "Usage: $0 --value <value>"
    exit 1
    ;;
esac
done


if [ -z "$VALUE" ]; then
    echo "Value not provided."
    exit 1
fi


echo -n "$VALUE" | xxd -r -p | openssl enc -des-cbc --nopad --nosalt -K e84ad660c4721ae0 -iv 0000000000000000 -d -provider legacy -provider default | hexdump -Cv
