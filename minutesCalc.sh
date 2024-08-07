#!/bin/bash

# minutes_between.sh

# later features:
# validation for 00 and 60
# potential removal of negative symbol from result
# inclusion of for, if and/or case functions depending

echo "Input first integer: "
read mainInt
echo "Input second integer: "
read secInt

result=$(((mainInt-secInt)))
echo $result
