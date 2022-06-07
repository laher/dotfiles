#!/bin/bash

# just the basics

sudo apt update
sudo apt install -y zsh
chsh -s $(which zsh)
sudo apt install -y git-core git \
	stow tmux wget curl \
	neovim \
	python3-dev python3-pip exuberant-ctags

