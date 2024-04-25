#!/bin/bash


# id -u -n
USER_NAME=$(id -nu) # grab result to a variable

if [[ ${?} -ne 0 ]]; then
    echo "fetching user id failed!, existing"
    exit 1
fi

echo "your username is ${USER_NAME}"

if [[ $UID -eq 0 ]]
then
    echo "welcome sudo, but please don't execute is as admin"
    exit 1 # fail, close
else
    echo "you've run the script as regular user!"
fi

# single line with semicolons
# if [[ $UID -eq 0 ]]; then echo 'foobar'; fi

EXPECTED_NAME="kamil.figon"
if [[ $USER_NAME != $EXPECTED_NAME ]] # string comparison
then
    echo "expected only ${EXPECTED_NAME}, got ${USER_NAME}"
    exit 1 
fi

read -p 'give me a value: ' VAL

if [[ $VAL -gt 5 ]]; then
    echo "$VAL is greater than 5"
elif [[ $VAL -lt 5 ]]; then
    echo "$VAL is less than 5"
else
    echo "$VAL is 5"
fi

echo 'all gut'
exit 0