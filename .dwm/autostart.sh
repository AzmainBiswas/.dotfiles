#!/usr/bin/env bash

SEP1="["
SEP2="]"

. $HOME/.dotfiles/.dwm/scripts/dwm_weather
. $HOME/.dotfiles/.dwm/scripts/dwm_battery

echo "$(dwm_weather) $(dwm_battery)"
