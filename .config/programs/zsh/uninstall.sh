#!/usr/bin/bash

# change shell before uninstalling zsh
sudo chsh -s $(which bash) $(whoami)

if [ -x "$(command -v apt)" ]; then
	sudo apt remove zsh
else
	printf "The apt package manager is required to run this uninstall script"
fi

exec bash
