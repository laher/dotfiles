#!/bin/bash

./setup-debian.sh

if grep --quiet Ubuntu /etc/lsb-release; then
#neovim has a ppa. debian?
#	sudo apt-get install software-properties-common
#	sudo add-apt-repository ppa:neovim-ppa/stable

	sudo apt-get update
	sudo apt-get install neovim
	sudo apt-get install python3-dev python3-pip
	sudo apt-get install exuberant-ctags


	sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
	sudo update-alternatives --config vi
	sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
	sudo update-alternatives --config vim
	sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
	sudo update-alternatives --config editor
fi


echo ":: Now run ./setup-pt2.sh and do the manual setups from README.asciidoc"

