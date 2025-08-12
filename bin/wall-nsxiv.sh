#!/usr/bin/env bash

# set wallpaper using nsxiv 
# select wallpaper using m and quite

wall_name=$(fd . /mnt/media/wallpapers/ --type f -e "png" -e "jpg" -e "jpeg" | nsxiv -tb -io -Z 100)

if [[ -f "${wall_name}" ]]; then
    cp -f ${wall_name} "$HOME/.config/background"

    case "$XDG_SESSION_TYPE" in 
        x11)
            feh --bg-fill "$HOME/.config/background"
            ;;
        wayland)
            pkill swaybg
            swaybg -m fill -i $HOME/.config/background &
           ;;
        *)
            notify-send "wall-nsxiv" "Session Type Unknown"
            ;;
    esac
fi
