#!/bin/bash

### find_mv_.sh ###
# script cleaning
# - removal of unnecessary break in if loop
# - Removal of mention in test.txt in output variable

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
	output=$(find $origdir -type f -name "*$teststring*" >&2)
	#readfile=$(cat test.txt | nl)
	echo $readfile
	echo "Would you like to move these files? [Y/n]: "
	read resp2
	if [[ "$resp2" == [Yy] ]]; then
		find $origdir -type f -name "*$teststring*" -exec cp -t $destdir {} +
	else
		echo "Exiting"
	fi
else
	echo "Please enter values!"
fi
