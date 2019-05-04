#!/bin/zsh

cd "$(dirname "$0")"
./push-apt.sh
./push-npm-g.sh
./push-python.sh
source ./zsh/.zshrc.d/pmpy
pmpy
zplug install
./pull-stow.sh
./pull-apt.sh
./pull-npm-g.sh
./pull-python.sh
