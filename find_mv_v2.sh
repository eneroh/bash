#!/bin/bash

### find_mv_v2.sh ###
# update to original but with confirmation of files before executing the copy/move, specifically an output of what you are about to move. This functionality wasn't present before
# More additions to come:
# - 

echo "Input original file/s directory [/home/<user>/<dir>]: "
read origdir
echo "Input search term: "
read teststring
echo "Input destination directory: [/home/<user>/<dir>]: "
read destdir
echo "Is this information correct? [Y/n]: "
read resp1
if [[ "$resp1" == [Yy] ]]; then
	echo "Gathering results"
	output=$(find $origdir -type f -name "*$teststring*" > test.txt >&2)
	#readfile=$(cat test.txt | nl)
	echo $readfile
	echo "Would you like to move these files? [Y/n]: "
	read resp2
	if [[ "$resp2" == [Yy] ]]; then
		find $origdir -type f -name "*$teststring*" -exec cp -t $destdir {} +
	else
		echo "Exiting"
		break
	fi
else
	echo "Please enter values!"
fi
