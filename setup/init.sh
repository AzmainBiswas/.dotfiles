# install fzf
install_fzf() {
    if [ -d ~/.fzf ]; then
        printf "repo is alrady exist in ~/.fzf\n"
        printf "Updating the repo\n"
        cd $HOME/.fzf/ && git pull
        printf "if necessary please run -> ~/.fzf/install <- manually.\nSorry for my bash skill...\n"
    else
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf &&
            ~/.fzf/install
    fi
}

# install starship
install_starship() {
    if command -v starship &>/dev/null; then
        printf "starship alrady exists\n"
    else
        curl "https://starship.rs/install.sh" -o /tmp/starship.sh &&
            chmod +x /tmp/starship.sh && /tmp/starship.sh
    fi
}

# install zoxide
install_zoxide() {
    if command -v zoxide &>/dev/null; then
        printf "zoxide alrady installed\n"
    else
        curl "https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh" -o /tmp/zoxide.sh &&
            chmod +x /tmp/zoxide.sh && /tmp/zoxide.sh
    fi
}

# tmux tpm
install_tmux_tpm() {
    if [ -d ~/.tmux/plugins/tpm ]; then
        printf "tpm for tmux alrady exist\n"
    else
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
        printf "tpm is cloned.\n"
    fi
}
