#!/usr/bin/env bash

nm-applet &
blueman-applet &
dunst -config "$HOME/.config/dunst/dunstrc" &
# emacs --daemon &
# xfce3-power-manager &
mpd &
clipmenud &
numlockx & 
# kdeconnect-indicator &
flameshot &
lxpolkit &
picom --config $HOME/.config/i3/picom.conf &
# picom &
copyq --start-server &
