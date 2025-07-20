function odf
    set -l dotfiledir "$HOME/.dotfiles/"
    set -l dir (fdfind . $dotfiledir -t d --hidden | fzf)
    if [ "$dir" = "" ]
        echo "choose directory"
    else if [ "$dir" = " " ]
        echo "choose directory"
    else
        cd $dir
        nvim .
    end
end
