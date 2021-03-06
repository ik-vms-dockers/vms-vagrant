#!/usr/bin/env bash

echo 'Setup ZSH and other plugins'
# install zsh shell
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install zsh -y

!copy .zshrc at this point

# make zsh default shell
which zsh
sudo chsh -s "$(command -v zsh)" "${USER}"
#chsh -s $(which zsh)
#sudo chsh -s /usr/bin/zsh


# install oh-my-zsh (configuration management)
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install pip and powerline
sudo apt-get install python-pip -y
sudo pip install --upgrade pip
sudo pip install setuptools
sudo pip install powerline-status

mkdir ~/.fonts
cp /vagrant/basebox/fonts/*.ttf ~/.fonts/.
sudo apt install fontconfig -y
fc-cache -fv ~/.fonts

mkdir -p ~/.config/fontconfig/conf.d/
cp /vagrant/basebox/10-symbols.conf ~/.config/fontconfig/conf.d/.

# just move fonts from folder

# powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k


# install autocompltions
git clone git://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# add to .zshrc plugins=(zsh-autosuggestions)

# copy template
cp /vagrant/template/zsh/.zshrc ~/.zshrc
