#!/usr/bin/zsh

dir="${XDG_DATA_HOME}/zsh-autosuggestions"

sudo rm -rf $dir
exec zsh
