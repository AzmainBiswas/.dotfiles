#!/usr/bin/env bash

SCRIPTFOLDER="$HOME/bin/"
DMENU="dmenu -F -i -l 10 -p"
ROFI="rofi -dmenu -i -p"
FZF='fzf --height 70% --border rounded --reverse --prompt'

main() {
    script=$(fd . $SCRIPTFOLDER --type x | awk -F'/' '{ print $NF }'  | $MENU "Script Launcher > ")
    if [ "script" == "" ] || [ "script" == " " ]
    then
        exit
    fi
    exec "$SCRIPTFOLDER/$script"
}

MENU=$DMENU
main
