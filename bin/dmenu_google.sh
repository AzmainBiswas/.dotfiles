#!/usr/bin/env bash
#
# google search via dmwnu
#

get_quary() {
    : | dmenu -p "Google Search 🔍 " | tr ' ' '+'
}

quary=$( get_quary )
if [ -n "$quary" ]; then
    firefox --new-tab "https://www.google.com/search?q=${quary}"
else
    exit 2
fi