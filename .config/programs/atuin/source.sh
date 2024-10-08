#!/usr/bin/zsh

source $XDG_CONFIG_HOME/programs/.functions.sh
add_to_path "/opt/atuin-x86_64-unknown-linux-gnu"

[[ -x "$(command -v atuin)" ]] && eval "$(atuin init zsh)"
