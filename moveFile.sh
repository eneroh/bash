#!/bin/bash
printf "%s" "Input file to move: "
read -r -- fileInput
fileSel=$(ls | grep -i $fileInput)

sudo rsync -rRP "$fileSel" <ssh server location>
