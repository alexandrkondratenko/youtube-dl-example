#!/bin/bash

# ffmpeg required to merge audio and video streams by youtube-dl itself.
brew install ffmpeg

# Latest youtube-dl.
git clone https://github.com/ytdl-org/youtube-dl.git

# EXAMPLE:
# https://www.youtube.com/watch?v=f0yJbrXmtOU
# youtube id = "f0yJbrXmtOU"

id="f0yJbrXmtOU"

# Retrieve formats.
# Not required, for demonstration purposes only.
python3 youtube-dl/youtube_dl/__main__.py -F "$id"

# Actually download and merge streams.
# This is the main command line to use.
python3 youtube-dl/youtube_dl/__main__.py -f bestvideo+bestaudio -o "downloads/%(id)s.%(ext)s" "$id"

# To encode in mp4 format, use command line argument: --recode-video mp4
python3 youtube-dl/youtube_dl/__main__.py -f bestvideo+bestaudio --recode-video mp4 -o "downloads/%(id)s.%(ext)s" "$id"
