#!/usr/bin/env bash

feh --bg-fill $HOME/.config/background &
nm-applet &
# blueman-applet &
dunst -config "$HOME/.config/dunst/dunstrc" &
# emacs --daemon &
xfce3-power-manager &
mpd &
# clipmenud &
numlockx on & 
# kdeconnect-indicator &
flameshot &
# polkit
# lxpolkit &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
picom --config $HOME/.config/picom/picom.conf &
copyq --start-server &
