ZSH="/home/cloudshell-user/.oh-my-zsh"

#Envvars
export PATH="$HOME/bin:$PATH"
export AWS_PAGER=""

#Aliases
alias ls="ls -lha"
alias tf="terraform"
alias tfi="terraform init"
alias tfp="terraform plan -out tf.plan"
alias tfpd="terraform plan -out tf.plan -destroy"
alias tfa="terraform apply tf.plan"
alias tfd="terraform destroy"
alias tff="terraform fmt"
alias tfv="terraform validate"
alias reload="source ~/.zshrc"

#Theme
ZSH_THEME=""

#Plugins
plugins=(git)
source $ZSH/oh-my-zsh.sh

#Star Ship
eval "$(starship init zsh)"

#Whoami
echo "**************************************"
echo "*** Your AWS identity is..."
aws sts get-caller-identity
echo
echo "*** Your GIT identity is..."
git config --global --list | grep user. --color=never
echo "**************************************"
