#!/bin/bash

cd "$(dirname "$0")"
./push-apt.sh
./push-npm-g.sh
pmpy
./pull-stow.sh
./pull-apt.sh
./pull-npm-g.sh
