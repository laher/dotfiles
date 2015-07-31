#!/bin/bash

sudo apt-get install -y vim aptitude zsh

chsh -s $(which zsh)

sudo aptitude install -y git-core git chromium-browser \
	stow tmux wget vim-nox python-pip python-dev
sudo pip install thefuck

echo ":: Now run ./vim-setup.sh and do the manual setups from README.asciidoc"

