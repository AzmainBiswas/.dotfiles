export PATH=${HOME}/.local/bin:${HOME}/bin:${HOME}/.cargo/bin:${PATH}
export PATH=/usr/local/go/bin:${HOME}/go/bin:${PATH}

export BROWSER=firefox
export EDITOR=nvim
export TERM=xterm-256color

export STARSHIP_CONFIG=~/.config/starship/starship.toml

# neovim as man page
# export MANPAGER="nvim +Man!"
# export MANPAGER="bat -l man -p"

# if running bash
# if [ -n "$BASH_VERSION" ]; then
# include .bashrc if it exists
#    if [ -f "$HOME/.bashrc" ]; then
#	. "$HOME/.bashrc"
#    fi
#fi

[[ -f $HOME/.bashrc ]] && . ~/.bashrc

# fzf
export FZF_DEFAULT_OPTS='--height 90% --layout=reverse --border'
export FZF_DEFAULT_COMMAND='fd --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --strip-cwd-prefix --hidden --follow --exclude .git"

# export SDL_VIDEODRIVER=wayland
# export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORMTHEME=qt5ct
# export QT_STYLE_OVERRIDE=kvantum
# export QT_QPA_PLATFORM=gtk2
# export XDG_CURRENT_DESKTOP=sway
# export XDG_SESSION_DESKTOP=sway

if [ -e /home/azmain/.nix-profile/etc/profile.d/nix.sh ]; then . /home/azmain/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
	export MOZ_ENABLE_WAYLAND=1
fi
. "$HOME/.cargo/env"
