#!/bin/bash

url="https://github.com/TomWright/dasel/releases/download/v2.8.1/dasel_linux_amd64.gz"
source $HOME/.config/programs/.functions.sh
download_to_opt $url
exec zsh
