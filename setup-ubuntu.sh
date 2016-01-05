#!/bin/bash

sudo apt-get install -y vim aptitude zsh

chsh -s $(which zsh)

sudo aptitude install -y git-core git \
	stow tmux wget vim-nox python-pip python-dev curl
sudo pip install thefuck

echo ":: Now run ./setup-vim.sh and do the manual setups from README.asciidoc"

