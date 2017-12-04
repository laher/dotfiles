#!/bin/bash

cd ~/dotfiles
stow vim
stow tmux
stow zsh
stow spacemacs

mkdir -p ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim
mkdir -p ~/.local/share/nvim
ln -s ~/.vim ~/.local/share/nvim/site

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall
vim +GoInstallBinaries


mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
