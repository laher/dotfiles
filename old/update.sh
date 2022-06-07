#!/bin/zsh

git pull
zplug install
./update/stow.sh
./update/apt.sh
./update/npm-g.sh
./update/python.sh
