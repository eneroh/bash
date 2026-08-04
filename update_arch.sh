#!/usr/bin/env bash

set -euo pipefail

printf "%b" "\n" >> .update.sh
date "+%A %d %B %Y %H:%M:%S %p" >> .update.sh
printf "%b" "\n" >> .update.sh
sudo pacman -Sy && sudo pacman -Qu 
sudo pacman -Qu >> .update.sh
sudo pacman -Syu >> .update.sh
