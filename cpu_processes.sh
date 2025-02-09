#!/bin/bash

### cpu_processes.sh ###
# displays the top 10 most intensive cpu processes
#
# ps displays process
# axch is for particular formatting
# a and x go off of BST's formatting
# c shows the true command name instead of an extended name
# h removes headers/column headers
#
# cmd specifies process names
# 15 limits the spacing to 15 spaces, shrinking the output
# sort sorts the cpu percentages by most intensive
# head displays the first 11 lines

line1=$(ps axch -o cmd:15,%cpu --sort=-%cpu | head)

echo -e "CPU Intensive Processes: \n$line1"
