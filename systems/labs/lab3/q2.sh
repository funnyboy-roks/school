#!/bin/bash

prod () {
    local out=1
    for arg in $@; do
        out=$((out * arg))
    done;
    printf "$out"
}

if [[ $# -lt 1 ]]; then
    echo "Usage: ./q2.sh <numbers...>"
    exit 1;
fi
echo "product of $@ is $(prod $@)"

