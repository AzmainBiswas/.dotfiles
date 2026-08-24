#!/usr/bin/env sh

printf "Creating symbolic links in...\n"
set -ex

#######
# home
#######
ln -sfn "$PWD/.bash_profile" "$HOME/.bash_profile"
ln -sfn "$PWD/.bashrc" "$HOME/.bashrc"
ln -sfn "$PWD/.inputrc" "$HOME/.inputrc"
ln -sfn "$PWD/.tmux.conf" "$HOME/.tmux.conf"
ln -sfn "$PWD/bin" "$HOME/bin"

###########
# .configs
###########
ln -sfn "$PWD/ghostty" "$HOME/.config/ghostty"
ln -sfn "$PWD/alacritty" "$HOME/.config/alacritty"
ln -sfn "$PWD/kitty" "$HOME/.config/kitty"
ln -sfn "$PWD/foot" "$HOME/.config/foot"
ln -sfn "$PWD/fastfetch" "$HOME/.config/fastfetch"
ln -sfn "$PWD/mpv" "$HOME/.config/mpv"
ln -sfn "$PWD/rofi" "$HOME/.config/rofi"
ln -sfn "$PWD/hypr" "$HOME/.config/hypr"
ln -sfn "$PWD/waybar" "$HOME/.config/waybar"
ln -sfn "$PWD/dunst" "$HOME/.config/dunst"
ln -sfn "$PWD/starship" "$HOME/.config/starship"

###########
# .local
###########
ln -sfn "$PWD/.local/share/applications/KDEWall.desktop" "/home/azmain/.local/share/applications/KDEWall.desktop"

