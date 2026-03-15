#!/bin/bash

# I asked google gemini on how they would improve this script. It turns out they would do the below. However, the script is broken at line 22/23. I can't seem to fix it for the life of me. However, I did note on some good ideas, I can potentially implement. Pending implementation.

read -p "Input search string: " search
[[ -z "$search" ]] && { echo "No search string inputted"; exit 1; }

echo "Searching for: $search..."

# 1. Get the URL directly using yt-dlp's search functionality
# This avoids downloading the file to disk first.
video_url=$(yt-dlp --get-id "ytsearch1:$search")
video_url="https://www.youtube.com/watch?v=$video_url"

read -p "Change resolution? (default: best) [y/N]: " resConfirm

if [[ "$resConfirm" == [Yy] ]]; then
    echo "1) 240p  2) 480p  3) 720p  4) 1080p  5) 1440p  6) 2160p"
    read -p "Choose [1-6]: " resChoice

    case $resChoice in
        1) h=240 ;;
        2) h=480 ;;
        3) h=720 ;;
        4) h=1080 ;;
        5) h=1440 ;;
        6) h=2160 ;;
        *) h="" ;;
    esac

    if [[ -n "$h" ]]; then
        # Use mpv's built-in ytdl-format handling
        FORMAT="bestvideo[height<=$h]+bestaudio/best[height<=$h]"
    fi
fi
echo "Playing: $video_url"
mpv --ytdl-format="${FORMAT:-best}" "$video_url"
