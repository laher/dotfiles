#!/bin/bash

brew install zsh 

chsh -s "$(which zsh)"

brew install git stow tmux
brew install wget

echo ":: Now run ./setup-pt2.sh and do the manual setups from README.asciidoc"
