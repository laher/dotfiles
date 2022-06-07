#!/bin/bash

brew install zsh

chsh -s "$(which zsh)"

brew install neovim stow
brew install git tmux wget
brew install awscli gh go golangci-lint lazygit firefoxpwa fzf mysql redis node the_silver_searcher tree
brew install --cask inkscape authy alt-tab foxitreader kitty mysqlworkbench

echo ":: Now run ./setup-pt2.sh and do the manual setups from README.asciidoc"
