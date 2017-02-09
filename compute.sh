#!/bin/bash

#Date: 1/21/16
#This script will calculate simple arithmetic and will allow the user to enter two values.
#Usage: ./compute.sh

result="0" #will hold the result for the operation

if [[ "$#" -ne 0 ]]; then
	echo "Error! Does not accept any arguments."
	echo "Usage: $0"
	exit
fi


echo -n "Enter an integer: "
read firstInteger

if [[ "$firstInteger" =~ ^-?[0-9]+$ ]]; then
	
	echo -n "Enter another integer: "
	read secondInteger
	
	if [[ "$secondInteger" =~ ^-?[0-9]+$ ]]; then
		
		echo -n "Enter an operation (add,sub,mul,div,exp): "
		read operationInput


		case "$operationInput" in

		add)
		    result=$(( $firstInteger + $secondInteger ))
		    echo "$firstInteger + $secondInteger = $result"
		    ;;
		sub)
		    result=$(( $firstInteger - $secondInteger ))
		    echo "$firstInteger - $secondInteger = $result"
		   ;;	
		mul)
		    result=$(( $firstInteger * $secondInteger ))
		    echo "$firstInteger * $secondInteger = $result"
		   ;;
		div)
		    result=$(( $firstInteger / $secondInteger ))
		    echo "$firstInteger / $secondInteger = $result"
		   ;;
		exp)
		    result=$(( $firstInteger ** $secondInteger ))
		    echo "$firstInteger ** $secondInteger = $result"
 		   ;;
		*) 
		    echo "Invalid entry" >&2
		    exit 1
		    ;;
		esac

	
	else
	   echo "The value you entered $secondInteger is not an integer. Terminating..." >&2
	   exit 1
	fi
else 
   echo "The value you entered $firstInteger is not an integer. Terminating ... " >&2
   exit 1
fi

