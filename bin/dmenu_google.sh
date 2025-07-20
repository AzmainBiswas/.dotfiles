
#!/usr/bin/env bash
#
# google search via dmwnu
#
# take browser from envioment variable

get_quary() {
    : | dmenu -p "Google Search 🔍 " | tr ' ' '+'
}

quary=$( get_quary )
if [ -n "$quary" ]; then
    ${BROWSER} --new-tab "https://www.google.com/search?q=${quary}&udm=14" # &udm=14 for removing googls nonsence
else
    exit 2
fi
