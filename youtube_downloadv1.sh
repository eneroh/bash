#!/bin/bash

### youtube_downloadv1.sh ###

echo "Input search [artist - song]: "
read search

yt-dlp ytsearch1:"$search"
