#!/bin/bash

cp -f "$1" $HOME/.config/background
pkill hyprpaper
# swaybg -m fill -i $HOME/.config/background &
hyprpaper &
notify-send -i $HOME/.config/background "WallPaper set!!" "Wallpaper has been set to $1" &
