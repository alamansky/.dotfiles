#!/usr/bin/zsh

dir="/opt/nvim-linux64"

sudo rm -rf $dir
sudo rm -rf $XDG_CONFIG_HOME/nvim
sudo rm -rf $XDG_STATE_HOME/nvim
sudo rm -rf $XDG_DATA_HOME/nvim 
sudo rm -rf $XDG_CACHE_HOME/nvim
exec zsh
