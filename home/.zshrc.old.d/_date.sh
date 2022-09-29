#!/bin/bash

function uk2nz {
	date --date="TZ=\"Europe/London\" $1"
}

function nz2uk {
	d="$1"
	if [ "$d" = "" ]; then
		d=`date +'%H:%M'`
	fi
	TZ=Europe/London date -d "$d NZDT"
}


function nz2 {
	export TZ="$1"
	d="$2"
	if [ "$d" = "" ]; then
		d=`date +'%H:%M'`
	fi
	date -d "$d NZDT"
}
