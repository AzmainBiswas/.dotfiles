export PATH=$HOME/.local/bin:$HOME/bin:$HOME/latex-bin:$HOME/menu-scripts:$HOME/.cargo/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export EDITOR=nvim
export TERM=screen-256color
export FZF_DEFAULT_OPTS='--height 70% --layout=reverse --border'
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export media=/mnt/media
export docs=/mnt/docs
export book=/mnt/docs/Book

# fzf
export FZF_DEFAULT_OPTS=''
export FZF_DEFAULT_COMMAND='fdfind --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fdfind --type d --strip-cwd-prefix --hidden --follow --exclude .git"

# export SDL_VIDEODRIVER=wayland
# export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORM=gnome
# export XDG_CURRENT_DESKTOP=sway
# export XDG_SESSION_DESKTOP=sway

if [ -e /home/azmain/.nix-profile/etc/profile.d/nix.sh ]; then . /home/azmain/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    export MOZ_ENABLE_WAYLAND=1
fi
export QT_QPA_PLATFORMTHEME=gnome
