#!/usr/bin/bash

source $XDG_CONFIG_HOME/programs/.functions.sh
add_to_path "/opt/oh-my-posh"

# set theme
# https://ohmyposh.dev/docs/installation/customize
export OMP_THEME="probua.minimal"
[[ -x "$(command -v oh-my-posh)" ]] && 
  eval "$(oh-my-posh init zsh --config ${XDG_CACHE_HOME}/oh-my-posh/themes/${OMP_THEME}.omp.json)"

