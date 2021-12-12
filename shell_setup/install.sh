
# Start zsh on startup. No chsh :(
echo 'bash -c zsh' >> $HOME/.bashrc

# Install fonts
curl -fsSLO https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Mononoki.zip
unzip Mononoki.zip -d ~/.fonts
rm -f Mononoki.zip
sudo yum -y install fontconfig
fc-cache -f
rm -rf fonts

# Install starship
mkdir $HOME/bin
sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --yes --bin-dir $HOME/bin
eval "$(starship init zsh)"

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
