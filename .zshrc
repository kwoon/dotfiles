ZSH=$HOME/.oh-my-zsh
ZSH_THEME="norm"

export UPDATE_ZSH_DAYS=1
export TERM=xterm-256color
export NODE_PATH=$HOME/.local/lib/node_modules
export PATH=$HOME/.local/bin:$PATH
export EDITOR=vim
export LD_LIBRARY_PATH=/usr/local/lib
export PATH=$HOME/.rvm/rubies/2.2.0/bin:$PATH

DISABLE_AUTO_TITLE="true"
DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git rvm rails lol bundler zeus vagrant)

source $ZSH/oh-my-zsh.sh
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
