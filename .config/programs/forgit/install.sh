#!/bin/bash

# https://github.com/wfxr/forgit

url="https://github.com/wfxr/forgit.git"
source $HOME/.config/shell/programs/.functions.sh
download_to_opt $url
exec zsh
