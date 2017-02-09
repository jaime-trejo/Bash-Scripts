#!/bin/bash

#Date:2/12/16
#This script uses sed to replace a work with another anywhere in the file.
#Usage: ./find_and_replace.sh existing_file new_file current_string new_String

if [[ "$#" -ne 4 ]]; then
	echo "Error! Needs to take 4 arguments"
	echo "usage: find_and_replace.sh existing_file new_file current_string new_string"
	exit 1
fi


if [[ ! -f "$1" ]]; then
	echo "Error! Needs to be a regular file"
	echo "usage: find_and_replace.sh existing_file new_file current_string new_string"
	exit 1
fi

if [[ -f "$2" ]]; then
	> "$2"
fi


while read line; do
	mod_line=$(echo "$line" | sed -r "s/$3/$4/g")
	echo "$mod_line" >> "$2"
done < "$1"


