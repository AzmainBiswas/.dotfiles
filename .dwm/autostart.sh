#!/usr/bin/env bash


feh --bg-fill $HOME/.config/background &
dwmblocks &
nm-applet &
# blueman-applet &
dunst -config "$HOME/.config/dunst/dunstrc" &
# emacs --daemon &
xfce4-power-manager &
mpd &
# clipmenud &
# numlockx on & 
# kdeconnect-indicator &
flameshot &
## polkit
lxpolkit &
# for debian
# /usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
# /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
picom --config $HOME/.config/picom/picom.conf &
copyq --start-server &
urxvtd &
