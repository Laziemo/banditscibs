#!/bin/bash

# Lists a process by a name
# Supports partial names

if [ $# -lt 1 ]
then
 printf "\nWrong Usage: Not enough arguments.\nusage:\n./list_process_by_name.sh name\n\n\n"
 exit 1
fi

ps aux | grep $1

exit 0

