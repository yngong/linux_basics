#!/bin/bash

# Author : Zac Gong
# Affiliation: CGU
# The first shell script follows here:

echo "What is your name?"
read INPUT

if [ "$INPUT" == "" ]; then
    echo "Null input. Program stopped."
    exit
else
    echo "Hello, $INPUT. Good to see you."
fi
