#!/usr/bin/env bash
# requires package: fzf

printf "%b" "Would you like to wipe your existing files? [y/N]: "
read -rn1 -- wipeInput
if [[ "$wipeInput" == [Yy] ]]; then
  printf "%b" "\nInput file directory to delete [/opt/couchdb or /data/]: "
  read -r -- dirInput
  printf "%b" "\nSudo will be used to wipe relevant folders"
  printf "%b" "\nYou have selected to completely start fresh with your couchdb database\n"
  printf "%b" "Wiping couchdb directories: /opt/couchdb\n"
  sudo rm -rf $(dirInput)
  printf "%b" "Do you want to remove your container? [y/N]: "
  read -rn1 -- input
  if [[ "$input" == [Yy] ]]; then
    cName=$(docker ps | awk '{print $1}' | tail -n 2)
    arrayCont=("${cName[@]}")
    lineCountAC=$(printf "%b" "$cName\n" | wc --lines)
    printf "%b" "\nChoose the container to delete [1-$lineCountAC]: "
    read -rn1 -- cName

    case $cName in
      1)  contDel=${arrayCont[0]}  ;;
      2)  contDel=${arrayCont[1]}  ;;
      *)  exit 1;  ;;
    esac

    printf "%b" "\nYou have selected to remove docker container instance: $contDel\n"
    printf "%b" "Stopping docker instance: $contDel\n"
    sudo docker stop "$contDel"
    printf "%b" "Removing docker instance: $contDel\n"
    sudo docker rm "$contDel"
    sudo docker ps
  else
    printf "%b" "\nYou have chosen to *NOT* delete your docker container. \nCancelling operation.\n"
  fi
else	
  printf "%b" "\nDo you want to remove your container? [y/N]: "
  read -rn1 -- input
  if [[ "$input" == [Yy] ]]; then
    cName=$(docker ps | awk '{print $1}' | tail -n 2)
    arrayCont=("${cName[@]}")
    lineCountAC=$(printf "%b" "$cName\n" | wc --lines)
    printf "%b" "\nChoose the container to delete [1-$lineCountAC]: "
    read -rn1 -- cName

    case $cName in
      1)  contDel=${arrayCont[0]}  ;;
      2)  contDel=${arrayCont[1]}  ;;
      *)  exit 1;  ;;
    esac

    printf "%b" "\nYou have selected to remove docker container instance: $contDel\n"
    printf "%b" "Stopping couchdb instance: $contDel\n"
    sudo docker stop "$contDel"
    printf "%b" "Removing couchdb instance: $contDel\n"
    sudo docker rm "$contDel"
    sudo docker ps
  else
    printf "%b" "\nYou have chosen to not delete your docker container. \nCancelling operation.\n"
  fi
fi
