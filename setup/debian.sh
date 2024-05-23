#!/usr/bin/env bash
# for all debian distro

# import common variable and functions
. ./init.sh

sudo apt install git stow exa curl wget ripgrep fd-find bash-completion tmux \
    xclip xsel sxiv feh pipx

pipx install trash-cli
pipx install yt-dlp

# fd-find to fd
mkdir -p ~/.local/bin
ln -s $(which fdfind) ~/.local/bin/fd

# install fzf
install_fzf

# install zoxide
install_zoxide

# install starship
install_starship

# install tmp
install_tmux_tpm
