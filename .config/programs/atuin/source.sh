#!/usr/bin/zsh

dir="/opt/atuin-x86_64-unknown-linux-gnu"

if [ -d $dir ] && [[ ":$PATH:" != *":${dir}:"* ]]; then
	export PATH="$PATH:$dir"
fi

if [ -x "$(command -v atuin)" ]; then
	eval "$(atuin init zsh)"
fi
