#!/bin/bash

function bumps {
	svc="$1"
	part="${2:-0}"
	#git tag|grep "${svc}-v"|sed "s/${svc}-//"|sort|tail -1|bump -stdin -part="$part"|sed "s/^/${svc}-/"
        git tag|grep "${svc}-v"|sort|tail -1|bump -prefix "${svc}-v" -stdin -part $part
}
