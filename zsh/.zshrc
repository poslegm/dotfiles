# ====== VISUAL ====== 
export TERM="xterm-256color"
# requires custom theme 
# git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
ZSH_THEME="powerlevel9k/powerlevel9k"

# requires nerdfont package (yaourt -S nerdfont-complete)
POWERLEVEL9K_MODE='nerdfont-complete'
# no useless icons
POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''
# fish-style truncating (/usr/share/plasma to /u/s/plasma)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
# Prompt segments
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir dir_writable)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(virtualenv vcs root_indicator background_jobs)

# command auto-correction.
ENABLE_CORRECTION=""

HIST_STAMPS="dd-mm-yyyy"

plugins=(archlinux tmux scala sbt pip python vagrant)

# automatically start a tmux session upon logging in
ZSH_TMUX_AUTOSTART=false

# ====== ENV ====== 
export SCALA_HOME=/usr/local/share/scala
export PATH=$SCALA_HOME/bin:/home/poslegm/.local/bin:$HOME/bin:/usr/local/bin:$PATH
export ZSH=/home/poslegm/.oh-my-zsh
export PATH=$PATH:~/.gem/ruby/2.5.0/bin/
export VISUAL="nvim"
export EDITOR="nvim"

# ====== SHELL ====== 
alias -s {py,ml,hs,erl,scala,java,go,cpp,c}=vim
alias -s {pdf,ps}=evince
alias -s {png,jpg,bmp,gif}=eog
alias -s {doc,odt}=libreoffice

set extendedglob # search by regexp in paths (ls **/src/*.erl)

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
bindkey -e

source $ZSH/oh-my-zsh.sh
