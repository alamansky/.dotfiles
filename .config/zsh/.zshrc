# set initial config var

export XDG_CONFIG_HOME="${HOME}/.config"

# source files

# source environment variables
[[ -s "${XDG_CONFIG_HOME}/shell/env.sh" ]] && source ${XDG_CONFIG_HOME}/shell/env.sh
# run startup scripts
[[ -s "${XDG_CONFIG_HOME}/shell/startup.sh" ]] && source ${XDG_CONFIG_HOME}/shell/startup.sh
# source aliases
[[ -s "${XDG_CONFIG_HOME}/shell/aliases.sh" ]] && source ${XDG_CONFIG_HOME}/shell/aliases.sh
# source functions
[[ -s "${XDG_CONFIG_HOME}/shell/functions.sh" ]] && source ${XDG_CONFIG_HOME}/shell/functions.sh
# source work file (contains anything used for professional dev)
[[ -s "${XDG_CONFIG_HOME}/shell/work.sh" ]] && source ${XDG_CONFIG_HOME}/shell/work.sh

# source autosuggestions file
# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#manual-git-clone
[[ -s "${XDG_DATA_HOME}/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] &&
source ${XDG_DATA_HOME}/zsh-autosuggestions/zsh-autosuggestions.zsh

# shell settings

# enable vim keybindings (terminal starts in insert mode)
bindkey -v

# make zsh compdump XDG compliant
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION

# set omp theme - https://ohmyposh.dev/docs/installation/customize
if [ -x "$(command -v oh-my-posh)" ]; then
	eval "$(oh-my-posh init zsh --config ${XDG_CONFIG_HOME}/oh-my-posh/.poshthemes/fish.omp.json)"
fi

# advanced zsh settings

# https://gist.github.com/LukeSmithxyz/e62f26e55ea8b0ed41a65912fbebbe52
# history settings:
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE="$XDG_STATE_HOME/zsh/.zsh_history"
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS

# basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select # this causes weird side-effects?
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# initialize programs

local program_directory="${XDG_CONFIG_HOME}/programs"

find $program_directory -type d | while read -r dir; do
	for file in "$dir"/*; do
    	if [ -f "$file" ] && [[ "${file##*/}" == "source.sh" ]]; then
			source $file
    	fi
	done
done

