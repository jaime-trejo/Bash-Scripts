#!/bin/bash

#Date:2/18/16
#Use curl to get your public IP by using regular expression on ipchicken.com
#Use curl to get your public IP by using cut
#Usage: ./get_external_ip.sh

if [[ "$#" -ne 0 ]]; then
	echo "Error! No arguments needed"
	echo "usage: $0"
	exit 1
fi

echo "Using Regex:"
(curl  -s www.ipchicken.com | grep -E -o -m 1 "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}")
echo "Using cut:"
(curl -s www.ipchicken.com |cut -d " " -f 5)

