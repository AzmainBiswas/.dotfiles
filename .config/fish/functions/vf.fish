function vf
    nvim $(fzf --height 75% --layout=reverse --border --preview "batcat --style=numbers --color=always --line-range :500 {}" ) $argv
end
