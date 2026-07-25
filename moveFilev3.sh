#!/usr/bin/env/ bash

### moveFilev3.sh ###
# File/folder manipulation
# Features:
# - New vpn checking capability
# - fzf (fuzzy finder) search capability to disregard multiple files with the same name
# - File move recorder that pushes items to txt location for later review
###

set -euo pipefail

vpnConf=$(mullvad status | grep -i "Connected")

if [[ "$vpnConf" == "Connected" ]]; then
  printf "%b" "Do you want to turn off your VPN? [Y/n]: "
  read -rn1 -- vpnInput
  if [[ "$vpnInput" == [Yy] ]]; then
    mullvad disconnect
    printf "%b" "\nInput movie to move: "
    read -r -- input
    fileSel=$(ls | grep -i $input | fzf)

    printf "%b" "1.movies\n2.tv\n3.music\n"
    printf "%s" "Input your category: "
    read -rn1 -- location

    case $location in
	1) loc=$(printf "/mass/movies") ;;
	2) loc=$(printf "/mass/tv") ;;
	3) loc=$(printf "/media") ;;
	*) exit; ;;
    esac

    sudo rsync -rRP "$fileSel" <ssh location>:$loc

	mfHistory=$(printf "%b" "\n$fileSel has been successfully moved to server\n" >> ./moveFiles_history.txt)
  else
    printf "%b" "\nVPN is not disconnected, please try again later!\n"
  fi
else
  printf "%b" "\nInput media file to move: "
  read -r -- input
  fileSel=$(ls | grep -i $input | fzf)

  printf "%b" "1.movies\n2.tv\n3.music\n"
  printf "%b" "\nInput your category: "
  read -rn1 -- location

  case $location in
	1) loc=$(printf "/mass/movies") ;;
	2) loc=$(printf "/mass/tv") ;;
	3) loc=$(printf "/media") ;;
	*) exit; ;;
  esac

  sudo rsync -rRP "$fileSel" <ssh location>:$loc   
fi

$(mfHistory)
