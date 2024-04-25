#!/bin/bash

if [[ ${#} -lt 1 ]]
then
    echo "USAGE - give me a command"
    exit 1
fi

case $1 in
    start)
        echo "starting"
    ;;
    stop)
        echo "stopping"
    ;;
    status|-s) echo "status: 89%" ;;
    *)
        echo "unknown command"
        exit 1
    ;;
esac