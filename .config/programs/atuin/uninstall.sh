#!/usr/bin/zsh

dir="/opt/atuin-x86_64-unknown-linux-gnu"

sudo rm -rf $dir
sudo rm -rf $XDG_CONFIG_HOME/atuin
sudo rm -rf $XDG_DATA_HOME/atuin
exec zsh
