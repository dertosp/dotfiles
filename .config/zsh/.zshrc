export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

setopt auto_menu
setopt complete_in_word
setopt always_to_end

setopt share_history

plugins=(fzf)

source $ZSH/oh-my-zsh.sh

eval "$(fnm env)"

