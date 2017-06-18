for DOTFILE in `find /home/poslegm/.dotfiles/zsh -type f`
do
    if [[ $DOTFILE != *"zshenv"* ]]; then
        source $DOTFILE
    fi
done 

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  xrandr --dpi 276
  unclutter --timeout 8 &
fi
