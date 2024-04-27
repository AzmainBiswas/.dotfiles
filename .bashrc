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

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# make less more friendly for non-text input files, see lesspipe(1)
[[ -x /usr/bin/lesspipe ]] && eval "$(SHELL=/bin/sh lesspipe)"
# complition
[[ -f /etc/profile.d/bash_completion.sh ]] && . /etc/profile.d/bash_completion.sh

#
# aliases
#
alias vim=nvim

# Move to the parent folder.
alias ..='cd ..;pwd'
# Move up two parent folders.
alias ...='cd ../..;pwd'
# Move up three parent folders.
alias ....='cd ../../..;pwd'

alias cp="cp -riv"
alias mv="mv -iv"
alias mkdir="mkdir -vp"

alias ls="exa -ahF --group-directories-first"
alias ll="exa -alhF --group-directories-first"
alias tree="exa -F --color=always --tree"

alias cls="clear"
alias spdl="spotdl --bitrate=320k"
alias tn="tmux new -s $(pwd | sed 's/.*\///g')"

alias grep='grep --color=auto'
alias config='/usr/bin/git --git-dir=$HOME/my-dotfiles/ --work-tree=$HOME'
alias gitsafe='git config --global --add safe.directory "$(pwd)"'

alias merge="xrdb -merge ~/.Xresources"

alias sb='source ~/.bashrc && echo "bashrc sourceed"'
alias eb='nvim ~/.bashrc'

#shell
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# finctions
#
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

# bash parameter completion for the dotnet CLI

function _dotnet_bash_complete() {
	local cur="${COMP_WORDS[COMP_CWORD]}" IFS=$'\n' # On Windows you may need to use use IFS=$'\r\n'
	local candidates

	read -d '' -ra candidates < <(dotnet complete --position "${COMP_POINT}" "${COMP_LINE}" 2>/dev/null)

	read -d '' -ra COMPREPLY < <(compgen -W "${candidates[*]:-}" -- "$cur")
}

complete -f -F _dotnet_bash_complete dotnet

[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash

###------------------- PROMPT -----------------------###

# parse_git_branch() {
# 	# Long form
# 	git rev-parse --abbrev-ref HEAD 2>/dev/null
# 	# Short form
# 	# git rev-parse --abbrev-ref HEAD 2> /dev/null | sed -e 's/.*\/\(.*\)/\1/'
# }

# bash git prompt
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM="verbose"

__git_ps1_improved() {
	local git_current_branch_name="\$(__git_ps1 '%s' | sed 's/ .\+//' | sed -e 's/[\\\\/&]/\\\\\\\\&/g')"
	local git_status_substitutes=(
		"s/$git_current_branch_name//;"          # remove branch temporarily
		"s/u//;"                                 # upstream
		"s/+\([0-9]\+\)/↑\1/;"                   # outgoing
		"s/-\([0-9]\+\)/↓\1/;"                   # incoming
		"s/%/?/;"                                # untracked
		"s/+/+/;"                                # staged
		"s/*/✕/;"                                # unstaged
		"s/\(.*\)/ $git_current_branch_name\1/;" # insert branch again
	)

	echo "\$(__git_ps1 '%s'| sed \"${git_status_substitutes[@]}\")"
}

function bash_prompt() {
	PS1='${debian_chroot:+($debian_chroot)}'
	# with username
	# PS1+=${blu}'\u'${clr}'@'${ylw}'\h'${cyn}' \W'${grn}' $(parse_git_branch)'${grn}' > '${clr}
	# With distro logo
	# PS1+=${cyn}'\w'${ylw}"$(__git_ps1_improved)"${grn}'  '${clr}
	PS1+=${cyn}'\w'${ylw}"$(__git_ps1_improved)"${grn}' ➜ '${clr}
}

# bash_prompt

# neofetch
eval "$(starship init bash)" #starship
# eval "$(oh-my-posh init bash --config $HOME/.config/oh-my-posh/my-oh-my-posh-gruvboc.omp.json)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# zoxide
# install zoxide first
[[ -x "/home/azmain/.local/bin/zoxide" ]] && eval "$(zoxide init bash)" && alias cd="z"
