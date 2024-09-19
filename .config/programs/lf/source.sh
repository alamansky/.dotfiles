#!/usr/bin/zsh

dir="/opt/lf"

if [ -d $dir ] && [[ ":$PATH:" != *":${dir}:"* ]]; then
	export PATH="$PATH:$dir"
fi
