#!/bin/bash

# get first and second positional param (0 is exec being run)
HOW_MANY_PASSWORDS=${1}
PASSWORD_LEN=${2}

if [[ $HOW_MANY_PASSWORDS == "" || $PASSWORD_LEN == "" ]]; then
    echo "please provide number of passwords and password len to generate"
    exit 1
fi

SPECIAL_CHARACTERS='!@#$%^&*()_+'


for I in $(seq 1 ${HOW_MANY_PASSWORDS})
do

    # random number + timestamp + random
    PASS="${RANDOM}$(date +%s)${RANDOM}"

    # shuf - shuffle input by lines
    # fold - wrap characters to lines
    # head - get x first chars
    CHAR=$(echo ${SPECIAL_CHARACTERS} | fold -b1 | shuf | head -c1)

    # hash and get first x chars
    HASH=$(md5 -qs ${PASS} | head -c${PASSWORD_LEN})
    echo ${HASH}${CHAR}
done