#!/usr/bin/env bash
# dmenu bookmark scripts

url=$(cat "$HOME/.local/share/bookmarks.txt" | dmenu -l 10 -p "uls >")
url=$(printf "$url" | sed "s/|.*//" )

[ -n "$url" ] && firefox --new-tab "$url"
