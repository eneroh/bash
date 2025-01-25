#!/bin/bash

### find_mv.sh ###
# purpose: All results with find function are copiable/moveable with a simple script
# Got a bit annoyed that the find command wasn't able to move things easily, so now I'm creating this script to make this process smoother
## Features: ##
# - User input string search 
# - Confirmation of action at end
# - clear variables
# - cp instead of mv safety (moved a bunch of test files from /home/<user> and filled my test folder with junk T_T)
#################

echo "Input original file/s directory [/home/<user>/<dir>]: "
read origdir
echo "Input search term: "
read input
echo "Input destination directory: [/home/<user>/<dir>]"
read destdir
echo "Is this information correct? '$origdir $input $destdir' [Y/n]: "
read runMain
if [[ "$runMain" == [Yy] ]]; then
	echo "Success!"
	find $origdir -type f -name "*$input*" -exec cp -t $destdir {} +
else
	echo "Please enter values!"
fi

## What do the {} and + mean? ##
# {} replace the {} with each find reult in turn
# + limits the amount of times the mv function is run

## failed attempts ##
# find /home/en/Downloads -type f -name "*<text>*" -exec mv -t /home/<user>/Downloads/<text> {} +

# mv $(find /home/<user>/Downloads -name "*<text>*") /home/<user>/Downloads/<text>

# for f in `find /home/<user>/Downloads -name "*<text>*"`; do cp $f /home/<user>/Downloads/<text>/; done

# source: https://unix.stackexchange.com/questions/154818/how-to-integrate-mv-command-after-find-command
