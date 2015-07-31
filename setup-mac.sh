#!/bin/bash

brew install zsh 

chsh -s $(which zsh)

brew install git stow tmux
brew install macvim --with-cscope --with-lua --HEAD --override-system-vim
brew install wget thefuck

echo ":: Now run ./vim-setup.sh and do the manual setups from README.asciidoc"
