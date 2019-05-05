#!/bin/bash

# This script can be run via curl

sudo apt update
sudo apt install -y zsh
chsh -s $(which zsh)
sudo apt install -y git-core git \
	stow tmux wget python-pip python-dev curl \
	neovim \
	python3-dev python3-pip exuberant-ctags

./install-vim.sh
./install-tmux.sh

git config --global credential.helper 'cache --timeout=3600'

cd $HOME
git clone https://github.com/laher/dotfiles.git
cd dotfiles
./update.sh

echo "now run install-pt2.sh"
