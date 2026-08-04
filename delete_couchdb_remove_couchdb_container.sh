#!/usr/bin/env bash
#

printf "%b" "Would you like to wipe your couchdb instance entirely? [y/N]: "
read -rn1 -- wipeInput
if [[ "$wipeInput" == [Yy] ]]; then
  printf "%b" "\nSudo will be used to wipe relevant folders"
  printf "%b" "\nYou have selected to completely start fresh with your couchdb database\n"
  printf "%b" "Wiping couchdb directories: /opt/couchdb\n"
  sudo rm -rf /opt/couchdb
  printf "%b" "Do you want to remove your couchdb container? [y/N]: "
  read -rn1 -- input
  if [[ "$input" == [Yy] ]]; then
    cName=$(sudo docker ps | awk '{print $1}' | sed 's/CONTAINER//g' | tr -d '\n')
    printf "%b" "\nYou have selected to remove couchdb docker container instance: $cName\n"
    printf "%b" "Stopping couchdb instance: $cName\n"
    sudo docker stop "$cName"
    printf "%b" "Removing couchdb instance: $cName\n"
    sudo docker rm "$cName"
    sudo docker ps
  else
    printf "%b" "\nYou have chosen to *NOT* delete your couchdb container. \nCancelling operation.\n"
  fi
else	
  printf "%b" "Do you want to remove your couchdb container? [y/N]: "
  read -rn1 -- input
  if [[ "$input" == [Yy] ]]; then
    cName=$(sudo docker ps | awk '{print $1}' | sed 's/CONTAINER//g' | tr -d '\n')
    printf "%b" "\nYou have selected to remove couchdb docker container instance: $cName\n"
    printf "%b" "Stopping couchdb instance: $cName\n"
    sudo docker stop "$cName"
    printf "%b" "Removing couchdb instance: $cName\n"
    sudo docker rm "$cName"
    sudo docker ps
  else
    printf "%b" "\nYou have chosen to not delete your couchdb container. \nCancelling operation.\n"
  fi
fi
