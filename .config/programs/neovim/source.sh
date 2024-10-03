#!/usr/bin/zsh

dir="/opt/nvim-linux64/bin"
 
if [ -d $dir ] && [[ ":$PATH:" != *":${dir}:"* ]]; then
	export PATH="$PATH:$dir"
fi
