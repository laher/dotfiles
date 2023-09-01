#!/bin/bash

brew install zsh

chsh -s "$(which zsh)"

brew install neovim stow
brew install git tmux wget
brew install awscli gh go golangci-lint lazygit firefoxpwa fzf mysql redis node the_silver_searcher tree alt-tab
brew install --cask inkscape authy alt-tab foxitreader kitty mysqlworkbench
# neovim package manager
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim


