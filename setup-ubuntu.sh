#!/bin/bash

sudo apt-get install -y vim aptitude zsh wget vim-nox

chsh -s $(which zsh)

sudo aptitude install -y git-core git chromium-browser \
	stow tmux


echo ":: Now do the manual setups from README.asciidoc"

