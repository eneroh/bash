#!/bin/bash

printf "%b" "\n" >> .update.sh
date "+%A, %d %B %Y %I:%M:%S %p" >> .update.sh
printf "%b" "\n" >> .update.sh
sudo apt update && sudo apt upgrade -y >> .update.sh
