#!/bin/bash

# Finds a file by name and returns its path
# Searches within a specific directory
# Supports partial name seach
if [ $# -lt 2 ]
then
 printf "\nWrong Usage: Not enough arguments.\nusage:\n./dir_specific_find_by_name.sh file_name dir_name\n"
 printf "\nExample:\n./dir_specific_find_by_name.sh test.json $(pwd)\n\n"
 exit 1
fi

find $2 -type f -name "$1"* -exec ls {} \;
exit 0
