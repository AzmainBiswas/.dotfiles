#!/usr/bin/env bash
# for all arch besed distro

set -xe
# import common variable and functions
. ./init.sh

sudo pacman -S --needed --noconfirm git stow starship fd ripgrep eza bash-completion \
	zoxide wl-clipboard\
    tmux xclip xsel trash-cli curl wget aria2 fastfetch sxiv feh libva-mesa-driver mesa-vdpau libvdpau-va-gl  

printf "\n"
# install fzf
install_fzf || printf "Some thing went wrong. check your internet.\n"

printf "\nInstalling zoxide\n"
# install zoxide
# install_zoxide

printf "\n"
#install tmux tpm
install_tmux_tpm || printf "Check your internet.\n"
