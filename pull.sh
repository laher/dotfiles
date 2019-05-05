#!/bin/zsh

git pull
zplug install
./pull-stow.sh
./pull-apt.sh
./pull-npm-g.sh
./pull-python.sh
