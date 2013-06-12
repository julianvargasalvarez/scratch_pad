#!/bin/bash
for number in {1..100}; do
    output=""
    if [ $((number%3)) -eq 0 ]; then
        output="Fizz"
    fi
    if [ $((number%5)) -eq 0 ]; then
        output="${output}Buzz"
    fi
    if [ -z $output ]; then
        echo $number
    else
        echo $output
    fi
done
