#!/usr/bin/env bash

quary_usr=$@

if [ "$quary_usr" = "" ]
then
    exit
fi

quary=$(echo "${quary_usr} original song audio")
audio_url=$(yt-dlp -f ba --get-url "ytsearch:${quary}" )

mpc stop
mpc clear
mpc add ${audio_url}
mpc play
mpc repeat

# notification
notify-send "Playing:" "${quary_usr}"
