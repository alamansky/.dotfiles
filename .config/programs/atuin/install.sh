#!/bin/bash

# https://github.com/atuinsh/atuin

# XDG_CONFIG_HOME/atuin/config.toml
# XDG_DATA_HOME/atuin/history.db

url="https://github.com/atuinsh/atuin/releases/download/v18.3.0/atuin-x86_64-unknown-linux-gnu.tar.gz"
source $HOME/.config/shell/programs/.functions.sh
download_to_opt $url
exec zsh

if [ -x "$(command -v dasel_linux_amd64)" ] && [ -n "$GROQ_API_KEY" ]; then
	dasel_linux_amd64 -f $XDG_CONFIG_HOME/aichat/config.yaml put -t string -v $GROQ_API_KEY 'clients.index(0).api_key'
else
	printf "Unable to automatically provision API key for aichat."
fi
