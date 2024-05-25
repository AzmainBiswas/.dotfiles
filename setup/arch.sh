#!/usr/bin/env bash
# for all arch besed distro

# import common variable and functions
. ./init.sh

sudo pacman -S --needed git stow starship zoxide fd ripgrep eza bash-completion \
    tmux xclip xsel trash-cli curl wget fastfetch sxiv feh libva-mesa-driver mesa-vdpau libvdpau-va-gl libva-vdpau-driver 

printf "\n"
# install fzf
install_fzf || printf "Some thing went wrong. check your internet.\n"

printf "\n"
#install tmux tpm
install_tmux_tpm || printf "Check your internet.\n"
