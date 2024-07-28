#!/bin/bash

# battery_script.sh
#
# Additional functionality for gnome

output=$(upower --dump | grep "model\|state\|percentage" | head -n 3 | tr -s " ")

echo -e "Mouse battery percentage \n$output"


#model
#state
#percentage
