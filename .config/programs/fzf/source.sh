#!/usr/bin/bash

source $XDG_CONFIG_HOME/programs/.functions.sh
add_to_path "/opt/fzf"

[[ -x "$(command -v fzf)" ]] && source <(fzf --zsh)
