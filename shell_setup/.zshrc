ZSH="/home/harshith/.oh-my-zsh"

#Theme
ZSH_THEME=""

#Plugins
plugins=(git zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

#Star Ship
eval "$(starship init zsh)"
