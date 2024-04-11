export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="brave-browser"
export TERM="xterm-256color"
export MANPAGER="less"
export QT_QPA_PLATFORMTHEME=gnome
export QT_STYLE_OVERRIDE=kvantum

# fzf
export FZF_DEFAULT_OPTS='--height 90% --layout=reverse --border'
export FZF_DEFAULT_COMMAND='fdfind --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fdfind --type d --strip-cwd-prefix --hidden --follow --exclude .git"

export STARSHIP_CONFIG='/home/azmain/.config/starship/starship.toml'
export PF_INFO='ascii title os kernel shell uptime palette'

############### PATH ##########################
export PATH="$HOME/bin:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/Documents/fetch-tools:$HOME/.dotnet/tools:$PATH"
export PATH=$PATH:/usr/local/go/bin

autoload -U colors; colors
autoload -U compinit

zstyle ':completion:*' menu yes=long select
zstyle ':completion:*' file-sort date
zstyle :compinstall filename '/home/azmain/.zshrc'
zstyle ':completion:*' verbose yes
# using cash for complition
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

# case-insensative and substring complition
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Colorize completions using default `ls` colors.
# zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# To get new binaries into PATH
zstyle ':completion:*' rehash true


compinit

##### HISTORY
HISTFILE=~/.zsh_history
HISTSIZE=100000000
SAVEHIST=100000000
setopt INC_APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_DUPS
bindkey -e

######### options ##############

setopt autocd extendedglob nomatch
setopt share_history



#########################################
########### plugins #####################
#########################################

# zsh-autosuggestions
if [[ -f "/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
else
    echo "To install zsh-autosuggestions:"
    echo "sudo apt install zsh-autosuggestions"
    echo ""
fi

#zsh-syntax-highlighting
if [[ -f "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
    echo "To install zsh-syntax-highlighting: "
    echo "sudo apt install zsh-syntax-highlighting"
    echo ""
fi

# Powerlevel10k
# if [[ -f "$HOME/.config/powerlevel10k/powerlevel10k.zsh-theme" ]]; then
#     source $HOME/.config/powerlevel10k/powerlevel10k.zsh-theme
# fi

# zsh-z
if [[ -f "$HOME/.config/zsh/zsh-z/zsh-z.plugin.zsh" ]]; then
    source $HOME/.config/zsh/zsh-z/zsh-z.plugin.zsh
else
    echo "clone zsh-z plugin for github."
    echo ""
fi

# zsh-history-substring-search
if [[ -f "$HOME/.config/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh" ]]; then
    source $HOME/.config/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
else
    echo "colne zsh-history-substring-search from github."
    echo ""
fi


# zsh fzf complition
source $HOME/.config/zsh/fzf/completion.zsh
source $HOME/.config/zsh/fzf/key-bindings.zsh
source $HOME/.config/zsh/zsh-autopair/autopair.zsh

##################
##### binds ######
##################

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

ZSH_AUTOSUGGEST_STRATEGY=(history completion)

###############################
######## alias ################
###############################

alias cls=clear
alias ..="cd .."
alias vim="nvim"
alias nivm="nvim"
alias sz='source ~/.zshrc;echo "ZSH aliases sourced."'
alias ez="nvim ~/.zshrc"

alias ls="exa -aF --color=always --group-directories-first --icons"
alias ll="exa -alF --color=always --group-directories-first --icons"
alias tree="exa -F --color=always --tree"

alias merge="xrdb -merge ~/.Xresources"
alias spdl="spotdl --bitrate=320k" 
alias tn="tmux new -s $(pwd | sed 's/.*\///g')"
alias fzf_clip="cliphist list | fzf | cliphist decode | wl-copy"

alias clock="tty-clock -tc"
alias spe="source $HOME/.python_env/bin/activate"

#shell
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"

################################
######## functions #############
################################

odf() {
    dir="$(fdfind . $HOME/.dotfiles -t d --hidden | fzf)"

    if [[ "${dir}" == "" ]]; then
        echo "choose a directory"
    else
        cd ${dir}
        nvim .
    fi
}

sd() {
    local dir
    dir="$(fdfind . --type directory | fzf)"
    cd ${dir}
}

vf() {
    local file
    file="$(fzf --height 75% --layout=reverse --border --preview 'batcat --style=numbers --color=always --line-range :500 {}')"
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
    mkdir -p "$@" && cd "$@" && pwd
}

###---------- ARCHIVE EXTRACT ----------#####

ex() {
    local file_name
    file_name="$(echo $1 | awk -F. '{print $1}')"
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   mkdir "./$file_name" && tar xvjf $1 --directory="./$file_name"  ;;
        *.tar.gz)    mkdir "./$file_name" && tar xvzf $1 --directory="./$file_name" ;;
        *.bz2)       bunzip2 $1   ;;
        *.rar)       unrar x $1   ;;
        *.gz)        gunzip $1    ;;
        *.tar)       mkdir "./$file_name" && tar xvf $1 --directory="./$file_name" ;;
        *.tbz2)      mkdir "./$file_name" && tar xvjf $1 --directory="./$file_name" ;;
        *.tgz)       mkdir "./$file_name" && tar xvzf $1 --directory="./$file_name";;
        *.zip)       unzip $1 -d "./${file_name}"     ;;
        *.Z)         uncompress $1;;
        *.7z)        7za e x $1   ;;
        *.deb)       ar x $1      ;;
        *.tar.xz)    mkdir "./$file_name" && tar xvf $1 --directory="./$file_name" ;;
        *.tar.zst)   unzstd $1    ;;
        *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

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

# zsh parameter completion for the dotnet CLI
_dotnet_zsh_complete()
{
  local completions=("$(dotnet complete "$words")")

  # If the completion list is empty, just continue with filename selection
  if [ -z "$completions" ]
  then
    _arguments '*::arguments: _normal'
    return
  fi

  # This is not a variable assignment, don't remove spaces!
  _values = "${(ps:\n:)completions}"
}

compdef _dotnet_zsh_complete dotnet


########### PROMT ####################
PROMPT='%F{green}%B%n%f%F{red}@%f%F{blue}%m%b%f %F{gray}on%f %F{green}%B%2~%b%f %(?.%F{blue}>.%F{red}>)%f '

eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
