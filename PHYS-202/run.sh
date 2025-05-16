#!/bin/sh

typst watch $1.typ &
typst_pid=$!

mupdf $1.pdf &
mupdf_pid=$!

echo $1.pdf | entr -pns "kill -HUP $mupdf_pid" &
entr_pid=$!

trap quit SIGINT
quit() {
    echo
    echo 'Cleaning up'
    kill $typst_pid
    kill $entr_pid
    kill $mupdf_pid
}

wait $mupdf_pid
quit
