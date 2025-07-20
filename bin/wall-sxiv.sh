#!/usr/bin/env bash

# set wallpaper using sxiv 
# select wallpaper using m and quite

wall_name=$(fd . /mnt/media/wallpapers/ --type f -e "png" -e "jpg" -e "jpeg" | sxiv -tb -io -Z 100)

if [[ -f "${wall_name}" ]]; then
    cp -f ${wall_name} "$HOME/.config/background" && feh --bg-fill "$HOME/.config/background" 
fi
