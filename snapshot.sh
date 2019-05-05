#!/bin/zsh

cd "$(dirname "$0")"
./snapshot-apt.sh
./snapshot-npm-g.sh
./snapshot-python.sh
