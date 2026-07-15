#!/bin/bash

printf "%s" "Input movie to move: "
read -r -- movieInput
movieSel=$(ls | grep -i $movieInput)

printf "%b" "1.movies\n2.tv\n"
printf "%s" "Input your category: "
read -rn1 -- location

case $location in
	1) loc=$(printf "movies") ;;
	2) loc=$(printf "tv") ;;
	*) exit; ;;
esac

sudo rsync -rRP "$movieSel" <ssh location>
