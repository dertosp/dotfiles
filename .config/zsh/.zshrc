export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="custom"

setopt auto_menu
setopt complete_in_word
setopt always_to_end

HISTSIZE=10000000
SAVEHIST=10000000
setopt share_history

plugins=(fzf)

source $ZSH/oh-my-zsh.sh

eval "$(fnm env)"

