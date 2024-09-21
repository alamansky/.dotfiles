# install from apt repository
if [ -x "$(command -v apt)" ]; then
	sudo apt install zsh
else
	printf "The apt package manager is required to run this install script"
fi

# change shell
sudo chsh -s $(which zsh) $(whoami)

# create .zshenv file
if [ ! -f $HOME/.zshenv ]; then
  touch $HOME/.zshenv
fi

# create .zshenv contents and output to file
zshenv="# set zsh root directory\nexport ZDOTDIR="$HOME/.config/zsh"\n"
printf "$zshenv" > $HOME/.zshenv

exec zsh
