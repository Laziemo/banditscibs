#!/bin/bash

# Finds a file by name and returns its path
# Searches system wide
# Supports partial name search

if [ $# -lt 1 ]
then
 printf "\nWrong Usage: Not enough arguments.\nusage:\n./system_wide_find_by_name.sh file_name\n\n\n"
 exit 1
fi

printf "\nRequesting root permissions to execute system wide find\n\n"
sudo find / -type f -name "$1"* -exec sudo ls {} \;
exit 0
