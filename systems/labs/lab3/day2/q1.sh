#!/bin/bash

# Name: Hayden Pott
# Date: 18 Okt 2023
# Desc: do things

printf "Directory to scan for messages: "
read path

ls -ogv "$path" | tail -n+1 | awk '{print $1}' | ./a.out

echo "" # trail newline
