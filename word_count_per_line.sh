#!/bin/bash

#Date: 1/22/16
#This script will display the number of words in each line of a file.
#The file is read by standard input coming in from a pipe, total will also be displayed.
#Usage: cat file | ./word_count_per_line.sh

count="0"
wordTotal="0"

if [[ "$#" -ne 0 ]]; then
	echo "Error! Does not accept any arguments"
	echo "Usage: $0 "
	exit
fi

while read line; do
   lineWordValue=$( echo "$line" | wc -w)
   #echo "Line $(( ++count )): $line"	#display line number and content for test purposes
   echo "Line $(( ++count )) : $lineWordValue"
   wordTotal=$(( $wordTotal + $lineWordValue ))
done

echo "Total: $wordTotal"

