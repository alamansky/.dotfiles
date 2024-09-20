#!/usr/bin/zsh

dir="/opt/oh-my-posh"

sudo rm -rf $dir
sudo rm -rf $XDG_CONFIG_HOME/oh-my-posh
sudo rm -f $HOME/omp.cache
exec zsh
