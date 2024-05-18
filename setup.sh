#!/usr/bin/env bash

. /etc/os-release

# functions
install_fzf() {
	if [ -d "$HOME/.fzf" ]; then
		printf "fzf is alrady installed.\n"
	else
		git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
	fi
}

install_startship() {
	if command -v starship &>/dev/null; then
		printf "starship is alrady installed.\n"
	else
		curl https://starship.rs/install.sh --output /tmp/starship_install.sh
		[ -f /tmp/starship_install.sh ] && chmod +x /tmp/starship_install.sh && /tmp/starship_install.sh
	fi
}

install_zoxide() {
	if command -v zoxide &>/dev/null; then
		printf "zoxide is alrady installed.\n"
	else
		curl https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh --output /tmp/zoxide.sh
        [ -f /tmp/zoxide.sh ] && chmod +x /tmp/zoxide.sh && /tmp/zoxide.sh
	fi
}

case "$ID" in
arch)
	printf "setup for arch linux\n"
    install_fzf
    install_startship
    install_zoxide
	;;
*)
	printf "sorry not supported\n"
	exit 2
	;;
esac
