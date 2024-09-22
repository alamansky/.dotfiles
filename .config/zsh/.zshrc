# set initial config var

export XDG_CONFIG_HOME="${HOME}/.config"

# source files
files=(
"env.sh" "startup.sh" "aliases.sh" "functions.sh" "work.sh" 
)
for file in "${files[@]}"; do
	[[ -s "${XDG_CONFIG_HOME}/shell/$file" ]] && source ${XDG_CONFIG_HOME}/shell/$file
done

# shell settings

# enable vim keybindings (terminal starts in insert mode)
bindkey -v

# edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# tab completion:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# make zsh compdump XDG compliant
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION

# initialize programs

local program_directory="${XDG_CONFIG_HOME}/programs"

find $program_directory -type d | while read -r dir; do
	for file in "$dir"/*; do
    	if [ -f "$file" ] && [[ "${file##*/}" == "source.sh" ]]; then
			source $file
    	fi
	done
done

