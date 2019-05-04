#!/bin/bash

# pullmepushyou
function pmpy {
	current=$(pwd)
	d="$1"
	if [ "$d" = "" ]; then
		d="."
	fi
	echo "$d"
	cd $d
	if git diff --quiet HEAD; then
		git pull
		git push
	else
		git add .
		git commit -m "pmpy"
		git pull
		git push
	fi
	cd "$current"
}

function pmpy_all {
	dirs=(~/dotfiles ~/.password-store ~/movio-dotfiles)
	for d in "${dirs[@]}"; do
		pmpy "$d"
	done

}
