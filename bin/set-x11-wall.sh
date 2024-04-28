#!/bin/bash

cp -f "$1" $HOME/.config/background
killall swaybg 
swaybg -m fill -i $HOME/.config/background &
notify-send -i $HOME/.config/background "WallPaper set!!" "Wallpaper has been set to $1" &
