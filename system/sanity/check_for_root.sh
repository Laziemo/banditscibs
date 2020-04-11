#!/bin/bash

# call this function in other scripts as follows:
# source banditscribs/system/sanity/check_for_root.sh
# CheckRoot

CheckRoot()
{
   if [ `id -u` != 0 ]
   then
      echo "ERROR: You must be root user to run this program"
      exit
   fi  
}


