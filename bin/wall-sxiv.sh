#!/usr/bin/env bash

# set wallpaper using sxiv 
# select wallpaper using m and quite

wall_name=$(fd . /mnt/media/wallpapers/ -t f | sxiv -t -b -io)

cp -f ${wall_name} "$HOME/.config/background" && feh --bg-fill "$HOME/.config/background" 
