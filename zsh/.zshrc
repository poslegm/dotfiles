export PATH=$HOME/bin:/usr/local/bin:/opt/homebrew/bin:$PATH
# ====== VISUAL ====== 
export TERM="xterm-256color"
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# command auto-correction.
ENABLE_CORRECTION=""

HIST_STAMPS="dd-mm-yyyy"

plugins=(tmux scala sbt pip python)

# automatically start a tmux session upon logging in
ZSH_TMUX_AUTOSTART=false

# ====== ENV ====== 
export SCALA_HOME=/usr/local/share/scala
export PATH=$SCALA_HOME/bin:/Users/poslegm/.local/bin:$HOME/bin:/usr/local/bin:$PATH
export ZSH=/Users/poslegm/.oh-my-zsh
export PATH=$PATH:~/.gem/ruby/2.5.0/bin/
export PATH="$PATH:/Users/poslegm/Library/Application Support/Coursier/bin"
export VISUAL="nvim"
export EDITOR="nvim"
# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# ====== SHELL ====== 
alias -s {py,ml,hs,erl,scala,java,go,cpp,c}=nvim

set extendedglob # search by regexp in paths (ls **/src/*.erl)

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
bindkey -e

ZSH_DISABLE_COMPFIX=true

# enable p10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source $ZSH/oh-my-zsh.sh
source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme
