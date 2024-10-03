#!/usr/bin/zsh

dir="/opt/zellij"

if [ -d $dir ] && [[ ":$PATH:" != *":${dir}:"* ]]; then
	export PATH="$PATH:$dir"
fi
