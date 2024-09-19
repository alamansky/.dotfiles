#!/usr/bin/zsh

dir="/opt/forgit/bin"

if [ -d $dir ] && [[ ":$PATH:" != *":${dir}:"* ]]; then
	export PATH="$PATH:$dir"
fi
