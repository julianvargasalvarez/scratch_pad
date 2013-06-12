#!/bin/bash
function isDivisibleBy {
  return $(($1%$2))
}

function fizzOrBuzz {
    output=""
    isDivisibleBy $1 3 && output="Fizz"
    isDivisibleBy $1 5 && output="${output}Buzz"
    if [ -z $output ]; then
        echo $1
    else
        echo $output
    fi
}

for number in {1..100}; do
    var=$(fizzOrBuzz $number)
    echo $var
done
