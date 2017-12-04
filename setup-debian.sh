#!/bin/bash

sudo apt-get install -y vim aptitude zsh

chsh -s $(which zsh)

sudo aptitude install -y git-core git \
	stow tmux wget vim-nox python-pip python-dev curl
sudo pip install thefuck
sudo apt-get install emacs
git config --global credential.helper 'cache --timeout=3600'
