#!/bin/bash

brew install zsh 

chsh -s $(which zsh)

brew install git stow tmux wget
brew install macvim --with-cscope --with-lua --HEAD --override-system-vim

echo ":: Now do the manual setups from README.asciidoc"
