#!/bin/bash

DATA="Dwight is the assistant regional manager"

# regex can be used
echo $DATA | sed 's/assistant/assistant to the/' 
# replace all occurences in a line, instead just the first
echo "foo bar foo" | sed 's/foo/bar/g' 
# replace only second occurence
echo "foo bar foo" | sed 's/foo/bar/2' 
