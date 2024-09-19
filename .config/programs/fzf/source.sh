#!/usr/bin/zsh

dir="/opt/fzf"

if [ -d $dir ] && [[ ":$PATH:" != *":${dir}:"* ]]; then
	export PATH="$PATH:$dir"
fi

if [ -x "$(command -v fzf)" ]; then
	source <(fzf --zsh)
fi
