ZSH=$HOME/.oh-my-zsh

ZSH_THEME="norm"

export UPDATE_ZSH_DAYS=1
export TERM=xterm-256color
export NODE_PATH=$HOME/.local/lib/node_modules
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.rvm/rubies/default/bin:$PATH
export EDITOR=vim

DISABLE_AUTO_TITLE="true"
DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git rvm rails lol debian bundler zeus vagrant npm)

source $ZSH/oh-my-zsh.sh
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 
