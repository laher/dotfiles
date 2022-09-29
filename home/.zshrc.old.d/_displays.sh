#!/bin/bash

function layout-work() {
	# xorg
	if [[ "${XDG_SESSION_TYPE}" == "x11" ]]; then
		xrandr \
			--output VIRTUAL1 --off \
			--output eDP-1 --off \
			--output DP-1 --off \
			--output HDMI-2 --off \
			--output HDMI-1 --off \
			--output DP-2 --off
		xrandr \
			--output VIRTUAL1 --off \
			--output eDP-1 --primary --mode 2560x1440 --pos 0x0 --rotate normal --scale 0.5x0.5 \
			--output HDMI-2 --mode 1920x1200 --pos 1400x0 --rotate normal \
			--output HDMI-1 --off \
			--output DP2 --off
	fi

	# sway (wayland)
	if [[ "${XDG_SESSION_TYPE}" == "wayland" ]]; then
		swaymsg output eDP-1 res 2560x1440 pos 0 0    scale 2
		swaymsg output HDMI-1  res 1920x1200 pos 1400 0 scale 1
		swaymsg -t get_outputs
	fi
}

function layout-hightable() {
	# xorg
	if [[ "${XDG_SESSION_TYPE}" == "x11" ]]; then
		xrandr \
			--output VIRTUAL1 --off \
			--output eDP1 --off \
			--output DP1 --off \
			--output HDMI-2 --off \
			--output HDMI-1 --off \
			--output DP2 --off
		xrandr \
			--output VIRTUAL1 --off \
			--output eDP1 --primary --mode 2560x1440 --pos 0x0 --rotate normal --scale 0.5x0.5 \
			--output HDMI-2 --mode 1920x1080 --pos 1600x0 --rotate normal \
			--output HDMI-1 --off \
			--output DP2 --off
	fi

	# sway (wayland)
	if [[ "${XDG_SESSION_TYPE}" == "wayland" ]]; then
		swaymsg output eDP-1 res 2560x1440 pos 0 0    scale 2
		swaymsg output DP-1  res 1920x1200 pos 1600 0 scale 1
		swaymsg -t get_outputs
	fi
}

function layout-laptop() {
	if [ "${HOST}" = "narya" ]; then
		LAPTOP_DISPLAY="eDP-1"
		LAPTOP_RESOLUTION="2560x1440"
		#LAPTOP_SCALE="0.5x0.5"
		LAPTOP_SCALE="1x1"
		LAPTOP_POSITION="0x0"
	elif [ "${HOST}" = "nenya" ]; then
		LAPTOP_DISPLAY="eDP-1"
		LAPTOP_RESOLUTION="1920x1080"
		LAPTOP_SCALE="1x1"
		LAPTOP_POSITION="0x0"
	else
		exit 1
	fi

	xrandr --output ${LAPTOP_DISPLAY} --off
	xrandr --output ${LAPTOP_DISPLAY} \
		--primary \
		--mode ${LAPTOP_RESOLUTION} \
		--pos ${LAPTOP_POSITION} \
		--scale ${LAPTOP_SCALE}
}
