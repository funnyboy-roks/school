#!/bin/bash
# Usage: ./q1.sh <num1> <num2>

printgcd () {
    printf "gcd of %d and %d is %d\n" $@
}

gcd () {
    local a=$1;
    local b=$2;
    if [[ $a -eq 0 ]]; then
        return $b
    fi
    while [[ $b -gt 0 ]]; do
        local r=$(( $a % $b ))
        a=$b
        b=$r
    done
    return $a
}

if [[ $# -eq 0 ]]; then
    echo "Usage: ./q1.sh <num1> <num2>"
    exit 1;
fi
printgcd $1 $2 $(gcd $1 $2)
