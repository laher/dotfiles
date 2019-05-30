#!/bin/zsh

cd "$(dirname "$0")"
python3 pip3.py|sort > ../packages/python3-packages.txt
python2 pip2.py|sort > ../packages/python2-packages.txt
