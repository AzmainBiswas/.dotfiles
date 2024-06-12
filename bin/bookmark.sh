#!/usr/bin/env bash
# dmenu bookmark scripts
# take browser form envioment variable

url=$(cat "$HOME/.local/share/bookmarks.txt" | dmenu -l 10 -p "uls >")
url=$(printf "$url" | sed "s/|.*//" )

[ -n "$url" ] && ${BROWSER} --new-tab "$url"
