#!/bin/bash

# Helper scripts to create a bootable disk with just dd
# Requires a USB to be plugged in before running
# For all popular Linux Distributions

if [ $# -lt 2 ]
then
 printf "\nUsage:\n./create_bootable_usb.sh usb_location iso_file\n"
 printf "\nRunning ls -lah /dev/sd*\n\n"
 ls -lah /dev/sd*
 printf "\nUnplug your USB device and rerun the script.\nObserve the result of ls -lah /dev/sd*"
 printf "\nPlug in your device.\nLocate your device as the new entry to the list.\nUse this path as usb_location.\n"
 exit 1
fi

sudo dd if=$1 of=$2

exit 0

