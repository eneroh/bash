#!/usr/bin/env bash

### rebootRequired.sh ###
# This bash script checks if a reboot is required
# You will also be presented with an option to cancel a system restart, in the unlikely case you miss something prior to system restart

set -euo pipefail

check1="cat /var/run/reboot-required"
#check1="restart required" # uncheck for testing purposes and check the above check1
check2="cat /var/run/reboot-required.pkgs"

if [[ "$check1" =~ "restart required" ]]; then
  printf "%b" "You will need to initiate a reboot.\n"
  printf "%b" "Packages: $check2\n"
  printf "%b" "Would you like to perform a reboot? [y/N]: "
  read -rn1 -- input
  if [[ "$input" == [Yy] ]]; then
    printf "%b" "\nYour system will restart in 1 minute\n"
    sudo shutdown -r +1 
    printf "%b" "Type c to cancel at any moment: "
    read -rn1 -- input
    if [[ "$input" == [Cc] ]]; then
      printf "%b" "\nCancelling reboot\n"
      sudo shutdown -c
    else
      printf "%b" "Continuing..."
    fi
  else
    exit;
  fi
else
  printf "%b" "No restart necessary, continue about your business!\n"
  printf "%b" "Output: $check2\n"
fi
