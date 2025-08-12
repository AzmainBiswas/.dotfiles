#!/usr/bin/env bash

nm-applet --indicator &
# crow &
# syncthingtray --wait &
blueman-applet &
xfce4-power-manager &
dunst &
# swaync &
mpd &
lxpolkit &
kdeconnect-indicator &
wl-paste --type text --watch cliphist store &
wl-paste --type image --watch cliphist store &
# xrdb -load .Xresources &
copyq --start-server &
foot --server &
# notify-send "HELLO" "$(whoami) wellcome" &
# /usr/bin/emacs --daemon &
