#!/bin/bash

cp -f "$1" $HOME/.config/background
pkill swaybg
swaybg -m fill -i $HOME/.config/background &
