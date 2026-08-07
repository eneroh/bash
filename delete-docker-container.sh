#!/usr/bin/env bash
# requires packageL fzf

printf "%b" "Would you like to wipe your existing files? [y/N]: "
read -rn1 -- wipeInput
printf "%" "Input file directory to delete: /opt/couchdb or /data/"
read -r -- dirInput
if [[ "$wipeInput" == [Yy] ]]; then
  printf "%b" "\nSudo will be used to wipe relevant folders"
  printf "%b" "\nYou have selected to completely start fresh with your couchdb database\n"
  printf "%b" "Wiping couchdb directories: /opt/couchdb\n"
  sudo rm -rf $(dirInput)
  printf "%b" "Do you want to remove your container? [y/N]: "
  read -rn1 -- input
  if [[ "$input" == [Yy] ]]; then
    cName=$(docker ps | awk '{print $1}' | tail -n 2 | fzf)
    printf "%b" "\nYou have selected to remove docker container instance: $cName\n"
    printf "%b" "Stopping docker instance: $cName\n"
    sudo docker stop "$cName"
    printf "%b" "Removing docker instance: $cName\n"
    sudo docker rm "$cName"
    sudo docker ps
  else
    printf "%b" "\nYou have chosen to *NOT* delete your docker container. \nCancelling operation.\n"
  fi
else	
  printf "%b" "\nDo you want to remove your container? [y/N]: "
  read -rn1 -- input
  if [[ "$input" == [Yy] ]]; then
    cName=$(docker ps | awk '{print $1}' | tail -n 2 |  fzf)
    printf "%b" "\nYou have selected to remove docker container instance: $cName\n"
    printf "%b" "Stopping couchdb instance: $cName\n"
    sudo docker stop "$cName"
    printf "%b" "Removing couchdb instance: $cName\n"
    sudo docker rm "$cName"
    sudo docker ps
  else
    printf "%b" "\nYou have chosen to not delete your docker container. \nCancelling operation.\n"
  fi
fi
