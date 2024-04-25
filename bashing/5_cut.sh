#!/bin/bash

DATA="1. foobar
2. asd and foo
3. sadf and bar
4. xax"

# "$DATA" - without " it wont print newlines

# get characters from 4 till end for each line
echo "$DATA" | cut -c 4-
echo 

# get second field (by tab)
echo -e "one\ttwo\tthree" | cut -f 2 # two
echo

# get third field (by delimiter)
echo "one,two,three" | cut -d ',' -f 3 # three
echo

# get fields by delimiter and change output delimiter, but doesnt work on zsh. We can use tr
# echo "one,two,three" | cut -d ',' --output-delimiter='->'
echo "one,two,three" | cut -d ',' -f 1- | tr ',' '->'
echo

# cut -d ':' -f 1,5 /etc/passwd # separate by :, get field 1 and 5 from etc/passwd. But it gets some header, so last 5 lines
tail -n 5 /etc/passwd | cut -d ':' -f 1,5
echo

# multi char delimiters - use awk

# get all files with size in /bin folder, sort revers numerically in desc
# du /bin/* | sort -rn