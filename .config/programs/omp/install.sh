#!/usr/bin/bash

# install dependency
[[ -x "$(command -v unzip)" ]] || sudo apt install unzip

# run install script
sudo mkdir -p /opt/oh-my-posh
sudo chmod 777 /opt/oh-my-posh
curl -s https://ohmyposh.dev/install.sh | bash -s -- -d /opt/oh-my-posh

exec zsh
