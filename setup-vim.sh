#!/bin/bash

DIR=~/.vim/bundle/Vundle.vim
if [ ! -d "$DIR" ]; then
	mkdir -p ~/.vim/bundle/
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
vim +PluginInstall +qall
