#
# ~/.bashrc
#

# color
blk='\[\033[01;30m\]' # Black
red='\[\033[01;31m\]' # Red
grn='\[\033[01;32m\]' # Green
ylw='\[\033[01;33m\]' # Yellow
blu='\[\033[01;34m\]' # Blue
pur='\[\033[01;35m\]' # Purple
cyn='\[\033[01;36m\]' # Cyan
wht='\[\033[01;37m\]' # White
clr='\[\033[00m\]'    # Reset

# shell options

shopt -s autocd
# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# vim mode
# set -o vi

# Don't put duplibate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace

# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend
PROMPT_COMMAND='history -a'

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# complition
[[ -f /etc/profile.d/bash_completion.sh ]] && . /etc/profile.d/bash_completion.sh
[[ -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion
[[ -f /etc/bash_completion ]] && . /etc/bash_completion

#
# aliases
#
alias vim=nvim
alias v=nvim

alias ebash='nvim ~/.bashrc'
alias sbash='source ~/.bashrc'

# Move to the parent folder.
alias ..='cd ..;pwd'
alias cd..="cd ..;pwd"
# Move up two parent folders.
alias ...='cd ../..;pwd'
# Move up three parent folders.
alias ....='cd ../../..;pwd'

# alias cp="rsync --human-readable --verbose --progress --archive --whole-file"
alias mv="mv -iv"
alias mkdir="mkdir -vp"

alias ls="exa -ahF --group-directories-first"
alias ll="exa -alhF --group-directories-first"
alias tree="exa -F --color=always --tree --icons"
alias cat="bat --plain --theme OneHalfDark"

# alias cls="clear"
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
#
tn() {
    tmux new -s $(pwd | sed 's/.*\///g')
}

odf() {
    dir="$(fd . $HOME/.dotfiles -t d --hidden | fzf)"

    if [[ "${dir}" == "" ]]; then
        echo "choose a directory"
    else
        cd ${dir}
        nvim .
    fi
}

sd() {
    local dir
    dir="$(fd . --type directory | fzf)"
    cd ${dir}
}

vf() {
    local file
    file="$(fzf --height 75% --layout=reverse --border --preview 'bat --style=numbers --color=always --line-range :500 {}')"
    if [[ ${file} == "" ]]; then
        echo 'please select one'
    else
        nvim ${file}
    fi
}

ovc() {
    cd $HOME/.config/nvim
    nvim .
}

mkcd() {
    mkdir -p "$@" && cd "$@"
}

# file extract
#
ex() {
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
rga-fzf() {
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

print_scripts() {
    local script_dir="${HOME}/bin/print-scripts/"
    local scripts=( "$script_dir"/* )
    local count=${#scripts[@]}
    if (( count > 0 )); then
        index=$(( $RANDOM % count ))
        [ -f "${scripts[${index}]}" ] && "${scripts[${index}]}"
    fi
}

# bash parameter completion for the dotnet CLI

function _dotnet_bash_complete() {
    local cur="${COMP_WORDS[COMP_CWORD]}" IFS=$'\n' # On Windows you may need to use use IFS=$'\r\n'
    local candidates

    read -d '' -ra candidates < <(dotnet complete --position "${COMP_POINT}" "${COMP_LINE}" 2>/dev/null)

    read -d '' -ra COMPREPLY < <(compgen -W "${candidates[*]:-}" -- "$cur")
}

complete -f -F _dotnet_bash_complete dotnet

###------------------- PROMPT -----------------------###

if [ ! -f "$HOME/.git-prompt.sh" ]; then
    curl --silent --output $HOME/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh && source ~/.git-prompt.sh
else
    source ~/.git-prompt.sh
fi

function bash_prompt() {
    # PS1+=${cyn}'\w'${ylw}"$(__git_ps1_improved)"${grn}'  '${clr}
    # PS1+=${cyn}'\W'${ylw}"$(__git_ps1_improved)"${grn}' ➜ '${clr}
    PS1="\[$(tput setaf 196)\][ \[$(tput setaf 165)\]\u\[$(tput setaf 220)\]@\[$(tput setaf 214)\]\H \[$(tput setaf 33)\]\w\[$(tput setaf 226)\]\$(__git_ps1) \[$(tput setaf 196)\]]\[$(tput sgr0)\]$ "
}

# bash_prompt

# starship
# install: curl -sS https://starship.rs/install.sh | sh
# if command -v starship &>/dev/null; then
#     eval "$(starship init bash)" #starship
# else
#     bash_prompt
# fi

bash_prompt
# eval "$(starship init bash)" #starship
print_scripts 

# fastfetch
# if command -v fastfetch &>/dev/null; then
# 	fastfetch
# fi

# conditional alias
# zoxide
if command -v zoxide &>/dev/null; then
    eval "$(zoxide init bash)" && alias cd="z"
fi


# $HOME/bin/print-scripts/unix

# fzf
[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash

# . "$HOME/.cargo/env"
# # zig 
# export PATH=${HOME}/.local/share/zig:${PATH}

#
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
