#!/usr/bin/env bash

set -euo pipefail

check1=$(cat /var/run/reboot-required)
check2=$(cat /var/run/reboot-required.pkgs)

if [[ "$check1" =~ "restart required" ]]; then
  printf "%b" "You will need to initiate a reboot.\n"
  printf "%b" "Packages: $check2\n"
  printf "%b" "Would you like to perform a reboot? [y/N]: "
  read -rn1 -- input
  if [[ "$input" == [Yy] ]]; then
    printf "%b" "\nYour system will restart in 30secs\n"
    sudo shutdown -r +1 
    printf "Type c to cancel at any moment"
    read -rn1 -- input
    if [[ "$input" == [Cc] ]]; then
      printf "%b" "\nCancelling reboot\n"
      sudo shutdown -c
    else
      sleep 30 && reboot
    fi
  else
    exit;
  fi
else
  echo "No restart necessary, continue about your business!"
fi
