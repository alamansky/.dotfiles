#!/bin/bash

# https://github.com/gokcehan/lf/
url="https://github.com/gokcehan/lf/releases/download/r32/lf-linux-amd64.tar.gz"
source $HOME/.config/shell/programs/.functions.sh
download_to_opt $url
exec zsh
