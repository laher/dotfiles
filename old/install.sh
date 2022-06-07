#!/bin/bash

# This script can be run via curl
./install/apt.sh
./postinstall/vim.sh
./postinstall/tmux.sh


#cd $HOME
#git clone https://github.com/laher/dotfiles.git
#cd dotfiles
./update.sh

sudo usermod -aG docker $USER 
echo "now run install-pt2.sh"
