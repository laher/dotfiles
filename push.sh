#!/bin/zsh

cd "$(dirname "$0")"
./push-apt.sh
./push-npm-g.sh
./push-python.sh
