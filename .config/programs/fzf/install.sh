#!/bin/bash

# https://github.com/junegunn/fzf

url="https://github.com/junegunn/fzf/releases/download/v0.54.3/fzf-0.54.3-linux_amd64.tar.gz"
source $HOME/.config/shell/programs/.functions.sh
download_to_opt $url
exec zsh
