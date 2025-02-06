#!/bin/bash

### count to 100.sh ###
# For loop to count to 100
#

#for {set a 0} $a<100 {incr x} {
#  puts "x is $a"
#}

for x in {1..100}
do
  echo "The current number is $x"
done
