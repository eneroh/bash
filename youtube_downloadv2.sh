#!/bin/bash

### youtube_downloadv2.sh ###

echo "Input URL [<youtubeURL>]: "
read url

yt-dlp "$url" -x --audio-format flac

