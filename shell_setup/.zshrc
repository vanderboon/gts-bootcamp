export ZSH="$HOME/.oh-my-zsh"

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
    colorize
    docker
    git
    history
    terraform
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
source $HOME/.zsh/zsh-syntax-highlighting/zsh-autosuggestions.zsh

alias ls="ls -lash"

#Autocomplete
autoload -U compinit && compinit
autoload -U +X bashcompinit && bashcompinit

#Init starship
eval "$(starship init zsh)"
