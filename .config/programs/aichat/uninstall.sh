#!/usr/bin/zsh

dir="/opt/aichat"

sudo rm -rf $dir
sudo rm -rf $XDG_CONFIG_HOME/aichat
exec zsh
