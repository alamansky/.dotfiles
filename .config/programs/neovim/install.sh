#!/bin/bash

# https://github.com/neovim/neovim 

# install zig as a dependency
# required for treesitting plugins
if [ -x "$(command -v asdf)" ] && [ -z "$(command -v zig)" ]; then
	asdf plugin-add zig https://github.com/asdf-community/asdf-zig.git
	asdf install zig 0.13.0
	grep -irq zig $HOME/.tool-versions || echo "zig 0.13.0" >> $HOME/.tool-versions 
fi

# install program
url="https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz"
source $HOME/.config/programs/.functions.sh
download_to_opt $url

# install theme
# https://nvchad.com/docs/quickstart/install/
git clone https://github.com/NvChad/starter ${XDG_CONFIG_HOME}/nvim
rm -rf ${XDG_CONFIG_HOME}/nvim/.git
/opt/nvim-linux64/bin/nvim
# manual step: run :MasonInstallAll command after lazy.nvim finishes downloading plugins

exec zsh
