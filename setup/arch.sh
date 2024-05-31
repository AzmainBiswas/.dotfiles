#!/usr/bin/env bash
# for all arch besed distro

# import common variable and functions
. ./init.sh

sudo pacman -S --needed --quite git stow starship fd ripgrep eza bash-completion \
    tmux xclip xsel trash-cli curl wget aria2 fastfetch sxiv feh libva-mesa-driver mesa-vdpau libvdpau-va-gl libva-vdpau-driver 

printf "\n"
# install fzf
install_fzf || printf "Some thing went wrong. check your internet.\n"

printf "\nInstalling zoxide\n"
# install zoxide
install_zoxide

printf "\n"
#install tmux tpm
install_tmux_tpm || printf "Check your internet.\n"
