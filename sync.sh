#!/bin/bash

cd "$(dirname "$0")"
git add . && git commit -m "udpate"
git pull && git push
stow
