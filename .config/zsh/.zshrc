# load modules
zmodload zsh/complist
autoload -U compinit && compinit
autoload -U colors && colors
# autoload -U tetris # main attraction of zsh, obviously

# cmp opts
zstyle ':completion:*' menu select # tab opens cmp menu
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' special-dirs false # force . and .. to show in cmp menu
# zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" # colorize cmp menu
# zstyle ':completion:*:builtins' list-colors '=*=1;38;5;142'
# # zstyle ':completion:*:aliases' list-colors '=*=34;38;5;128'
# zstyle ':completion:*:options' list-colors '=^(-- *)=34'
# zstyle ':completion:*:*:kill:*' list-colors '=(#b) #([0-9]#)*( *[a-z])*=34=31=33'
zstyle ':completion:*' file-list false # more detailed list
zstyle ':completion:*' squeeze-slashes false # explicit disable to allow /*/ expansion

# main opts
setopt append_history inc_append_history share_history # better history
# on exit, history appends rather than overwrites; history is appended as soon as cmds executed; history shared across sessions
setopt auto_menu menu_complete # autocmp first menu match
setopt autocd # type a dir to cd
setopt auto_param_slash # when a dir is completed, add a / instead of a trailing space
setopt no_case_glob no_case_match # make cmp case insensitive
setopt globdots # include dotfiles
setopt extended_glob # match ~ # ^
setopt interactive_comments # allow comments in shell
unsetopt prompt_sp # don't autoclean blanklines
stty stop undef # disable accidental ctrl s

# history opts
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE="$XDG_CACHE_HOME/zsh_history" # move histfile to cache
HISTCONTROL=ignoreboth # consecutive duplicates & commands starting with space are not saved

# binds
bindkey -e
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^k" kill-line
bindkey "^H" backward-kill-word
# ctrl J & K for going up and down in prev commands
# bindkey "^J" history-search-forward
# bindkey "^K" history-search-backward
# bindkey "$terminfo[kcud1]" history-search-forward
# bindkey "$terminfo[kcuu1]" history-search-backward
bindkey '^R' fzf-history-widget

bindkey "\e[1;5C" forward-word   # Ctrl + Right Arrow
bindkey "\e[1;5D" backward-word  # Ctrl + Left Arrow

function sudo_prefix() { LBUFFER="sudo $LBUFFER" }
zle -N sudo_prefix
bindkey "^[s" sudo_prefix

# # Make zsh autocomplete with up arrow
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "$terminfo[kcuu1]" history-beginning-search-backward-end
bindkey "$terminfo[kcud1]" history-beginning-search-forward-end
bindkey "^J" history-beginning-search-forward-end
bindkey "^K" history-beginning-search-backward-end

#
# aliases
#
alias vim=nvim

# Move to the parent folder.
alias ..='cd ..;pwd'
alias cd..="cd ..;pwd"
# Move up two parent folders.
alias ...='cd ../..;pwd'
# Move up three parent folders.
alias ....='cd ../../..;pwd'

alias cp="rsync --human-readable --verbose --progress --archive --whole-file"
alias mv="mv -iv"
alias mkdir="mkdir -vp"

alias ls="exa -ahF --group-directories-first"
alias ll="exa -alhF --group-directories-first"
alias tree="exa -F --color=always --tree --icons"
alias cat="bat --plain"

alias cls="clear"
alias spdl="spotdl --bitrate=320k"

alias grep='grep --color=auto'
alias config='/usr/bin/git --git-dir=$HOME/my-dotfiles/ --work-tree=$HOME'
alias gitsafe='git config --global --add safe.directory "$(pwd)"'

alias merge="xrdb -merge ~/.Xresources"

alias sb='source ~/.bashrc && echo "bashrc sourceed"'
alias eb='nvim ~/.bashrc'

# shell
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"

# git 
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gcm="git commit -m"
alias gp="git push"

# clipboard
alias pbcopy="xsel --input --clipboard"
alias pbpaste="xsel --output --clipboard"


# devour
# alias mpv='devour mpv'
# alias sxiv='devour sxiv'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# pacman
alias rmorphin='sudo pacman -Rns $(pacman -Qdtq)'

# finctions

function odf() {
    dir="$(fd . $HOME/.dotfiles -t d --hidden | fzf)"

    if [[ "${dir}" == "" ]]; then
        echo "choose a directory"
    else
        cd ${dir}
        nvim .
    fi
}

function sd() {
    local dir
    dir="$(fd . --type directory | fzf)"
    cd ${dir}
}

function vf() {
    local file
    file="$(fzf --height 75% --layout=reverse --border --preview 'bat --style=numbers --color=always --line-range :500 {}')"
    if [[ ${file} == "" ]]; then
        echo 'please select one'
    else
        nvim ${file}
    fi
}

function ovc() {
    cd $HOME/.config/nvim
    nvim .
}

function mkcd() {
    mkdir -p "$@" && cd "$@"
}

# file extract
#
function ex() {
    local file_name
    file_name="$(echo $1 | awk -F. '{print $1}')"
    if [ -f $1 ]; then
        case $1 in
        *.tar.bz2) mkdir "./$file_name" && tar xvjf $1 --directory="./$file_name" ;;
        *.tar.gz) mkdir "./$file_name" && tar xvzf $1 --directory="./$file_name" ;;
        *.bz2) bunzip2 $1 ;;
        *.rar) unrar x $1 ;;
        *.gz) gunzip $1 ;;
        *.tar) mkdir "./$file_name" && tar xvf $1 --directory="./$file_name" ;;
        *.tbz2) mkdir "./$file_name" && tar xvjf $1 --directory="./$file_name" ;;
        *.tgz) mkdir "./$file_name" && tar xvzf $1 --directory="./$file_name" ;;
        *.zip) unzip $1 -d "./${file_name}" ;;
        *.Z) uncompress $1 ;;
        *.7z) 7za e x $1 ;;
        *.deb) ar x $1 ;;
        *.tar.xz) mkdir "./$file_name" && tar xvf $1 --directory="./$file_name" ;;
        *.tar.zst) unzstd $1 ;;
        *) echo "'$1' cannot be extracted via ex()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# ripgrep all
function rga-fzf() {
    RG_PREFIX="rga --files-with-matches"
    local file
    file="$(
        FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
            fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
            --phony -q "$1" \
            --bind "change:reload:$RG_PREFIX {q}" \
            --preview-window="70%:wrap"
    )" &&
        echo "opening $file" &&
        xdg-open "$file"
}

function tn() {
    tmux new -s $(pwd | sed 's/.*\///g')
}

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Conditional alias for zoxide in Zsh
if command -v zoxide &>/dev/null; then
    eval "$(zoxide init zsh)" && alias cd="z"
fi

## plugins
# require zsh-autosuggestions
# source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# require zsh-autosuggestions
# source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

###------------------- PROMPT -----------------------###

# autoload -Uz vcs_info
# # Customize the Git info format: branch name in parentheses
# # zstyle ':vcs_info:git:*' formats '(%b)'
# # zstyle ':vcs_info:git:*' actionformats '(%b|%a)'
# zstyle ':vcs_info:*' check-for-changes true
# zstyle ':vcs_info:*' get-revision true
# zstyle ':vcs_info:git:*' formats "(%b)%m%u%c"
# zstyle ':vcs_info:git:*' actionformats '(%b|%a)%m%u%c'
#
# precmd() { vcs_info }
# setopt prompt_subst
# # PROMPT='%F{red}[ %F{magenta}%n%F{yellow}@%F{green}%m %F{cyan}%~ %F{blue}${vcs_info_msg_0_} %F{red}]%f%(?:%F{red}$%f:%F{green}$%f) '
# PROMPT='%B%F{white}(%F{magenta}%n%F{yellow}@%F{green}%m %F{cyan}%~ %F{blue}${vcs_info_msg_0_}%F{white})%f%b%(?:%{$fg_bold[green]%}$%f:%{$fg_bold[red]%}$%f) '

eval "$(starship init zsh)"
fastfetch
