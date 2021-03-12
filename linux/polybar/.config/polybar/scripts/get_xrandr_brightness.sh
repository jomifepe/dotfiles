#!/bin/sh

OUTPUT="DP-2"

CURR_XRANDR_BRIGHT=$(xrandr --verbose | grep "$OUTPUT" -A10 | awk '/Brightness/ { print $2 }')
CURR_BRIGHTNESS=`echo "($CURR_XRANDR_BRIGHT * 100)" | bc`
echo "${CURR_BRIGHTNESS%.*}"
