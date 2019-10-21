for DOTFILE in `find /Users/poslegm/.dotfiles/zsh -type f`
do
    if [[ $DOTFILE != *"zshenv"* ]]; then
        source $DOTFILE
    fi
done 
