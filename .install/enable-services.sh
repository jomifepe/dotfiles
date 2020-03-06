#!/bin/bash

if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

SERVICES=(
	"lightdm" 
	"bluetooth"
)

for i in "${SERVICES[@]}"; do
	systemctl enable "$i"
done