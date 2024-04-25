#!/bin/bash


# no space between var and assignment!!!1
# uppercase for convention
# single quotes prevent expansion of variables. if you want exactly what we wrote, use '
WORD='world'
number=123

echo 'hello'
echo $WORD # echo WORD will print WORD. we need to reference
# echo "$WORD"  # same
# echo '$WORD'  # will print $WORD
echo $number

echo "hello $WORD" # ${WORD} same, it's required for "hello ${WORD}ing"

