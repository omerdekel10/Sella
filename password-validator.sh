#!/usr/bin/bash
"""Validate password strength by conditions: min of 10 characters of numbers and lower case and upper case letters"""

PASSWORD=$1 
EXIT=1
MIN=10
RED="\033[0;31m"
GREEN="\033[0;32m"
DEFAULT="\033[0m"

if [ ${#PASSWORD} -ge 10 ]
    then
        if [[ $PASSWORD =~ [0-9] ]]
            then
                if [[ $PASSWORD =~ [^a-zA-Z] ]]
                    then
                    EXIT=0
                else
                    echo "Password must contain both lower and upper case characters"
                fi
        else
            echo "Password must contain numbers"
        fi
    else
        DIFF=$(($MIN-${#PASSWORD}))
        echo "Password must be at least 10 characters long (you are $DIFF short)"
fi

if [ $EXIT == 1 ]
    then
        echo -e "Password ${RED}$PASSWORD ${DEFAULT} is invalid"
    else
        echo -e "Password ${GREEN}$PASSWORD ${DEFAULT}is valid"
fi
