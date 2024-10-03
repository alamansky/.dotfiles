#!/usr/bin/zsh

dir="/opt/asdf"

sudo rm -rf $dir
sudo rm "${XDG_CONFIG_HOME}/asdf/asdfrc"
sudo rm "${XDG_DATA_HOME}/asdf"
exec zsh
