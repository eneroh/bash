#!/bin/bash

### mpv_yt_watch_v2.sh ###
# - Addition of null value check for youtubeUrl
# - Additional testing was performed and basically all exit values appear to be working

#mpv https://youtu.be/Uoox9fpmDP0 --ytdl-format="bestvideo[ext=webm][height=480]+bestaudio[ext=webm]"
#yt-dlp https://youtu.be/6Y1Emb7Jyks --list-formats > test.txt | grep '480p\|720p\|1080p\|1440p'

echo "Input youtube video url: "
read youtubeUrl
if [[ -z "$youtubeUrl" ]]; then
  echo "No URL inputted"
else
  echo "Would you like to change the resolution? (default is dependent on video) [Y/n] "
  read resConfirm
fi
if [[ "$resConfirm" == [Yy] ]]; then
  resInfo=$(yt-dlp $youtubeUrl --list-formats | grep -e '480p\|720p\|1080p\|1440p\|2160p' | awk '{print $14;}' | tr -d 'p,' | tr -s '\n' | uniq > res.txt)
  output=$(cat res.txt | nl | head -n 5)
  echo -e "Available resolutions: \n $output"
  echo "Choose resolution [1,2,3,4,5]: "
  read resInput
  case $resInput in
  "1")
    mpv $youtubeUrl --ytdl-format="bestvideo[ext=webm][height=480]+bestaudio[ext=webm]"
  ;;
  "2")
    mpv $youtubeUrl --ytdl-format="bestvideo[ext=webm][height=720]+bestaudio[ext=webm]"
  ;;
  "3")
    mpv $youtubeUrl --ytdl-format="bestvideo[ext=webm][height=1080]+bestaudio[ext=webm]"
  ;;
  "4") 
    mpv $youtubeUrl --ytdl-format="bestvideo[ext=webm][height=1440]+bestaudio[ext=webm]"
  ;;
  "5")
    mpv $youtubeUrl --ytdl-format="bestvideo[ext=webm][height=2160]+bestaudio[ext=webm]"
  ;;
  *)
    echo "Please enter a valid input!"
  ;;
  esac
elif [[ "$resConfirm" == [A-za-Z] ]]; then
  mpv $youtubeUrl
else
  echo "Please enter a valid input!"
fi
