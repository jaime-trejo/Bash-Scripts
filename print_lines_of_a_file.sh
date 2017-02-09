#!/bin/bash

#Date:1/21/16
#This script will use Head and Tail to display lines of a file.
#Usage: ./printlines.sh num1 num2 file

SHELLSCRIPT="$(basename $0)"
numberOfArguments="$#"
argumentsNeeded="3"
FILENAME="$3"

#echo "$numberOfArguments"
 
  if [ "$numberOfArguments" -lt "$argumentsNeeded" ]; then
    echo "You did not enter 3 arguments. $SHELLSCRIPT contains $numberOfArguments arguments"
	echo "You entered:"
	count=1
	 while [[ "$count" -le "$numberOfArguments" ]]; do
		echo "Argument $count = $1 "
		count=$((count + 1))
		shift
 done
	 exit 1
  elif [ "$numberOfArguments" -gt "$argumentsNeeded" ]; then
   echo "Too many arguments. Terminating..." >&2
	exit 1

  else
	#echo "Retrieving $FILENAME"
	if [ -f "$FILENAME" ]; then  
		#echo "File exists and is a regular file."
		
		if [ "$1" -le "$2" ]  && [ "$1" -ge 0 ]; then
		  
		         noOfLinesInFile=$(cat "$FILENAME" | wc -l)

		   if [ "$noOfLinesInFile" -gt "$2" ]; then
			
			newTailValue=$(( ( $2 - $1 ) + 1 )) #cal the new value for example 10-7=3 , add a 1
			(head -n $2 "$FILENAME" | tail -n "$newTailValue") 
                   else 
			echo "The number of the lines in the file are less than the request.Terminating..." >&2
			exit 1
		   fi
				 
		elif [ "$1" -le 0 ]; then
		  echo "Must be greater than 0. Terminating..." >&2
		  exit 1
		else 
		  echo "$1 is greater than $2. Terminating..." >&2
		  exit 1
		fi
        else 	
		echo "File does not exist or is not a regular file. Terminating ..." >&2
		exit 1
	fi
  fi

