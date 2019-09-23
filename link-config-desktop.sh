#!/bin/sh

COMMAND='stow --target=$HOME -R `ls -d */ | grep -v "laptop"`'
eval "$COMMAND -nv"

printf "\n\e[96mDo you want do perform this changes? (y/n): \e[39m"
read CONFIRMATION

if [ "${CONFIRMATION^^}" == "Y" ]; then
	eval "$COMMAND"
	printf "\e[92m✓ Done\n\e[39m"
fi
