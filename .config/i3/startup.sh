#!/usr/bin/env bash

~/.fehbg &
nm-applet &
# blueman-applet &
dunst -config "$HOME/.config/dunst/dunstrc" &
# emacs --daemon &
xfce4-power-manager &
mpd &
# clipmenud &
numlockx on & 
# kdeconnect-indicator &
flameshot &
# polkit
lxpolkit &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
# /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
# picom --experimental-backends --config $HOME/.config/picom/picom.conf &
picom --config $HOME/.config/picom/picom.conf &
copyq --start-server &
