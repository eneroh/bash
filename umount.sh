#!/bin/bash

# possibly one of the dumbest scripts I've tried making
# Instead of manually going about the gui to disconnect a flash drive, I've decided to create a script that does the job via the terminal entirely
# It looks for 1 /dev/sdX block device, then proceeds to eject them, does not work with multiple sdX block devices/flash drives. Will work if I add in "head -n 1" though
# Thinking about implementing a case switch in so that you can decide which sdX associated block device you would like to remove
# options, options

sdbGrab=$(lsblk | grep -e "/run/media" -B1 | grep -e ^"sd[A-Za-z]" | sed 's/sdb/\/dev\/sdb/g' | awk '{print $1}')
echo $sdbGrab
result=$sdbGrab
echo $result
if sudo grep -q ^\/dev\/sd[A-Za-z] "$sdbGrab"; then
  echo "1 sdb sighted"
elif sudo grep -q ^\/dev\/sd[A-Za-z]\|sd[A-Za-z] "$sdbGrab"; then
  echo "multiple sdb detected"
else
  echo "Skipped 1 sdb check and 2 sd checks"
fi
#eject=$(sudo eject $result)
#echo $eject
#output=$(echo $eject)

#echo output > eject_logs
#echo $result
#echo $eject

#$sdbGrab
#$eject
