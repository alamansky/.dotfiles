#!/usr/bin/bash

dir="/opt/oh-my-posh"

if [ -d $dir ] && [[ ":$PATH:" != *":${dir}:"* ]]; then
	export PATH="$PATH:$dir"
fi


# set theme
# https://ohmyposh.dev/docs/installation/customize
export OMP_THEME="probua.minimal"
if [ -x "$(command -v oh-my-posh)" ]; then
	eval "$(oh-my-posh init zsh --config ${XDG_CACHE_HOME}/oh-my-posh/themes/${OMP_THEME}.omp.json)"
fi

