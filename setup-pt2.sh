#!/bin/bash

cd ~/dotfiles
stow vim
stow tmux
stow zsh

ln -s ~/.vimrc ~/.config/nvim/init.vim

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall
vim +GoInstallBinaries
#!/bin/bash


