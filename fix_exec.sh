#!/bin/bash

#Date:2/25/16
#This script will remove the executable flags from a file if it's a regular file. If it's an
# executable file type then the user will be asked if he/she wants to set u,g,o as executable.
#Usage: ./fix_exec.sh

if [[ "$#" -ne 1 ]]; then
	echo "Error: Must contain one argument"
	echo "usage: $0 file"
	exit 1
fi

if [[ ! -f "$1" ]]; then
	echo "The argument is not a regular file."
	exit 1
fi

#will check if the file is executable or not
fileExecStatus=$(file "$1" | grep -E -o -m 1 "executable")

permissions=$(ls -l "$1")
permissionString=${permissions:1:9}
#echo $permissions
#echo $permissionString

userString=${permissionString:0:3}
userExecStatus=${userString:2:1}
#echo $userExecStatus

groupString=${permissionString:3:3}
groupExecStatus=${groupString:2:1}
#echo $groupExecStatus

otherString=${permissionString:6:3}
otherExecStatus=${otherString:2:1}
#echo $otherExecStatus


if [[ "$fileExecStatus" == "executable" ]]; then

	if [[ !  "$userExecStatus" == "x" ]]; then
		echo -n "Should the execute bit for executable.sh be set for user(y/n)?"
		read userResponse1
		
		if [[ "$userResponse1" == "y" ]]; then
			chmod u+x "$1"
		fi
	fi

	if [[ !  "$groupExecStatus" == "x" ]]; then
                echo -n "Should the execute bit for executable.sh be set for group(y/n)?"
                read userResponse2

                if [[ "$userResponse2" == "y" ]]; then
                        chmod g+x "$1"
                fi
        fi

	if [[ !  "$otherExecStatus" == "x" ]]; then
                echo -n "Should the execute bit for executable.sh be set for others(y/n)?"
                read userResponse3

                if [[ "$userResponse3" == "y" ]]; then
                        chmod o+x "$1"
                fi
        fi

	
	else

		if [[ "$userExecStatus"	== "x" ]]; then
			chmod u-x "$1"
			echo "removing user execute bit from $1"
		fi
		if [[ "$groupExecStatus" == "x" ]]; then
                        chmod g-x "$1"
                        echo "removing group execute bit from $1"
		fi
		if [[ "$otherExecStatus" == "x" ]]; then
                        chmod o-x "$1"
                        echo "removing others execute bit from $1"
		fi

fi	
