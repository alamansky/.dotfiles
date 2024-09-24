#!/usr/bin/zsh

dir="/opt/aichat"

if [ -d $dir ] && [[ ":$PATH:" != *":${dir}:"* ]]; then
	export PATH="$PATH:$dir"
fi

if [ -x "$(command -v dasel_linux_amd64)" ] && [ -n "$GROQ_API_KEY" ]; then
	dasel_linux_amd64 -f $XDG_CONFIG_HOME/aichat/config.yaml put -t string -v $GROQ_API_KEY 'clients.index(0).api_key'
else
	printf "Unable to automatically provision API key for aichat."
fi
