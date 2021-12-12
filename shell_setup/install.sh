
# Start zsh on startup. No chsh :(
[[ $AWS_EXECUTION_ENV  == "CloudShell" ]] && echo "In CloudShell, no need to install git/zsh" || sudo yum -y install git zsh
echo 'bash -c zsh' >> ~/.bashrc 

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended 

# Install fonts
git clone --depth=1 https://github.com/powerline/fonts.git
./fonts/install.sh
rm -rf fonts

# Install powelevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Add zsh-plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Copy standard zsh & powerline configs
cp ~/gts-bootcamp/shell_setup/.zshrc ~/.zshrc
cp ~/gts-bootcamp/shell_setup/.p10k.zsh ~/.p10k.zsh

# Add a bin folder in $HOME for our bootcamp binaries
mkdir ~/bin

# Add terraform to bin
curl -fsSLO https://releases.hashicorp.com/terraform/1.1.0/terraform_1.1.0_linux_amd64.zip
unzip terraform_1.1.0_linux_amd64.zip
rm terraform_1.1.0_linux_amd64.zip
mv terraform ~/bin && chmod 0755 ~/bin/terraform 

# Reload shell
. ./.zshrc
