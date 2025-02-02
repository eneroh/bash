#!/bin/bash

### batteryDetails.sh ###
# battery script for determining screen-on time/uptime and battery percentage

uptime=$(uptime -p | awk '{print $2,$3,$4,$5}')
battery=$(acpi -b | awk '{print $3,$4,$5,$6}')

echo "=== Battery Details Advanced ==="
echo Uptime: $uptime
echo Battery: $battery
