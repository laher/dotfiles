#!/bin/bash

sudo apt install -y neovim
mkdir -p ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim
mkdir -p ~/.local/share/nvim
ln -s ~/.vim ~/.local/share/nvim/site

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall
#vim +GoInstallBinaries
