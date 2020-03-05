#!/bin/bash

POSITIONAL=()
while [[ $# -gt 0 ]]; do
	case $1 in
		--yay)
		shift
		shift
		;;
		--packages)
		shift
		shift
		--compositor)
		shift
		shift
		--link-config)
		shift
		shift
		--set-shell)
		shift
		shift
		*)
		POSITIONAL+=("$1") # save it in an array for later
		shift # past argument
		;;
	esac
done
set -- "${POSITIONAL[@]}" 

echo -e "\e[92m"