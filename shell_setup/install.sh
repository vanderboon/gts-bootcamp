
# Start zsh on startup. No chsh :(
echo 'bash -c zsh' >> $HOME/.bashrc

# Install Oh-My-Zsh & plugins
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -- --unattended

# Install starship
mkdir $HOME/bin
export PATH="$HOME/bin:$PATH"
sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --yes --bin-dir $HOME/bin 

# Install fonts
curl -fsSLO https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Mononoki.zip
unzip Mononoki.zip -d ~/.fonts
rm -f Mononoki.zip
sudo yum -y install fontconfig
fc-cache -f

# Add terraform to bin
curl -fsSLO https://releases.hashicorp.com/terraform/1.1.0/terraform_1.1.0_linux_amd64.zip
unzip terraform_1.1.0_linux_amd64.zip
rm terraform_1.1.0_linux_amd64.zip
mv terraform ~/bin && chmod 0755 ~/bin/terraform 

# Copy standard zsh & powerline configs
cp ~/gts-bootcamp/shell_setup/.zshrc ~/.zshrc

# Start zsh
zsh
