foo() {
    local MESSAGE=${1}
    echo "hello ${MESSAGE}"
}

get() {
    return 1
}

foo "bar"

get
echo "get called, got status $?"