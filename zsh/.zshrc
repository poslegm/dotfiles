# ====== VISUAL ======
export TERM="xterm-256color"
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
export PATH=$PATH:/opt/coursier
export VISUAL="nvim"
export EDITOR="nvim"
export JAVA_HOME="/usr/lib/jvm/java-21-openjdk"

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

# enable p10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
