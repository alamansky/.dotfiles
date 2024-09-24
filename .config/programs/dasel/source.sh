#!/usr/bin/bash

dir="/opt/dasel_linux_amd64"

if [ -d $dir ] && [[ ":$PATH:" != *":${dir}:"* ]]; then
	export PATH="$PATH:$dir"
fi

alias dasel="dasel_linux_amd64"
