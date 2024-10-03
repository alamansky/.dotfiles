#!/bin/bash

# https://github.com/zellij-org/zellij

url="https://github.com/zellij-org/zellij/releases/download/v0.40.1/zellij-x86_64-unknown-linux-musl.tar.gz"
source $HOME/.config/programs/.functions.sh
download_to_opt $url
exec zsh
