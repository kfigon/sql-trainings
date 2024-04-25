# intro

## shebang
sharp/bang/path to interpreter (bash,zsh,sh,python,ruby). 

OS will pass the file to the interpreter

```
#!/bin/bash
```

## permissions
* read = 4
* write = 2
* execute = 1

`chmod 755 file` - I can read,write,ex, group can read and ex, everyone else can read and ex.

`chmod +x file` - add execute

## running and help
* run script: `./script_name` -> this_folder/filename
    * `.` current dir
* `help cmd` works only on shell built ins (`type cmd` to check that), not on `/usr/bin/...`
    * `man cmd` or `cmd -h` for programs/scripts
* `cmd | less` - pagination
* exit status - when 0 - success. Other - fail
* when exit is not specified at the end, script will use the last one available

## variables
* `NAME=123` no spaces!
* reference by `$NAME` or `${NAME}`
* store cmd output in var - `THE_VAR=$(ls)`
* `${?}` - exit status of recent command
* `${0}` - exec being run
* `${1}` - first positional param
* `${#}` - number of positional arguments passed to the program
* `${@}` - all arguments passed, but as array so we can iterate
* `${*}` - all arguments passed, but as single string

## if statements

* `if` is a cmd. `man if`. `if` returns status code 0, `then` is executed
* `[[` and `test` are also a cmd to eval expressions - bas specific
* on zsh `[` works - `type -a [`

spaces matter
```
if [[ var -eq 0 ]]
then
    echo '1'
elif [[ expr ]]
then
    echo 'x'
else
    echo '2'
fi
```

* semicolon instead of newline:
```
if [[ $UID -eq 0 ]]; then echo 'foobar'; fi
```

### string comparison
* `=` - strict string comparison
* `==` - regex match

### stdin
* `read` command
* we can pipe to not use the keyboard `echo 123 | read`

## loops

* `for`
```bash
for NAME in Frank Clair Doug
do
    echo $NAME
done

# 1,2,3
for I in {1..5}
do
    echo $I
done

# 1,2,3...HOW_MANY
for I in $(seq 1 ${HOW_MANY})
do
    echo $I
done
```

* `while`
```bash
while [[ true ]]
do
    echo ${RANDOM}
    sleep 1
done


I=0
while [[ $I -lt 10 ]]
do
    echo ${RANDOM}
    sleep 1
    I=$(($I+1))
done
```

## streams
* `|` to pass from command to command. stdout of left to stdin to right. no stderr
* `|&` combines also stderr
* `>` and `>>` - redirect std out to stream (e.g. file)
* `<` e.g. `read LINE < ${FILE}` - redirect stdin to program. File content to command
* stdin - FD 0, stoud FD 1, stderr FD 2 - file descriptors. We can use 0 1 2 ids to redirect to different streams
* redirect to stderr 

```bash
cat file 2>> foo.err

# redirect error and out
cat file 2>&1 foo.err

# Different syntax
cat file &> foo.err 
```
* null device - discard stream `cat non_existing_file > /dev/null`

## case

```bash
case $VAL in
    foo) echo "got foo" ;;
    bar) echo "got bar" ;;
    asdf|xax) echo "asdf or xax?" ;;
    *) #patterns, so catch all
        echo "unknown"
    ;;
esac
```

## function
functions work like script withing the script
exit from a function: `return 1` - non zero status. Not used to return values from function. get status by `$?`

```bash
foo() {
    local MESSAGE=${1}
    echo "hello ${MESSAGE}"
}

foo "bar"
```

## getopts
useful tool to parse cmd line args and flags

## text manipulation
* `tr` - replace characters. `tr '\n', ','` - newlines to commas
* `head`, `tail`
    * skip first line - `tail -n +2 filename`
* `sort`
    * `sort -n` - sort numerically, not string based
* `uniq`
* `grep` - regex
* `shuf` - random shuffle
* `fold` - split every x char to lines
* `wc` - word count
    * `wc -l` - line count
* `cat -n` - read with lines
* `cut` - basic substring extraction, delimiters
* `awk` - long delimiters, full syntax
* `sed` - stream edit - manipulation on std out and in. Substitute, remove, replace, insert etc. Works line by line
    * `sed 's/search-pattern/replace-string/flags' filename`
    * when using on the file, it's not replacing the content. It can, but need to specify flag `-i`. Backup can also be configured
