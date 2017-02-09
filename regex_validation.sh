#!/bin/bash

#Date:2/11/16
# This script will use regular expression to validate a user.
#Usage: ./regex_validation.sh

REGEX1="^[A-Z]([A-Za-z])+$"
REGEX2="^[A-Z]([A-Za-z])+$"
REGEX3="^[0-9]{5}$"
REGEX4="^([A-Za-z0-9\._-])+$"


if [[ "$#" -ne 0 ]]; then
	echo "Error! Must not accept any arguments."
	echo "usage: $0 "
	exit 1
fi


echo -n "First name: "
read first_name

if [[ ! "$first_name" =~ $REGEX1 ]]; then
	echo "First name must start with a capital letter and contain only letters."
 	exit 1
fi

echo -n "Last name: "
read last_name

if [[ ! "$last_name" =~ $REGEX2 ]]; then
	echo "Last name must start with a capital letter and contain only letters."
	exit 1
fi

echo -n "Zip code: "
read zip_code

if [[ ! "$zip_code" =~ $REGEX3 ]]; then
	echo "Zip code must be exactly 5 digits."
	exit 1
fi


echo -n "Email address: "
read email

if [[ ! "$email" =~ $REGEX4 ]]; then
	echo "Email address must be USER@DOMAIN, where both USER and DOMAIN must be only letters, numbers, dots, underscores, and hyphens."
	exit 1
fi


echo "Validated!"





