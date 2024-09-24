#!/bin/bash

# https://github.com/sigoden/aichat

url="https://github.com/sigoden/aichat/releases/download/v0.22.0/aichat-v0.22.0-x86_64-unknown-linux-musl.tar.gz"
source $HOME/.config/programs/.functions.sh
download_to_opt $url
exec zsh
