# adisve, 2024-03-25
if [[ $- != *i* ]] ; then
	return
fi

# Set the number of commands to remember in the command history.
HISTSIZE=10000
SAVEHIST=10000

# Set the file to save the command history.
HISTFILE=~/.zsh_history

# Use extended history format.
setopt EXTENDED_HISTORY

# Append to the history file, don't overwrite it.
setopt APPEND_HISTORY

# Save each command's timestamp.
setopt EXTENDED_HISTORY

# Remove duplicate entries.
setopt HIST_IGNORE_ALL_DUPS

# Do not store commands that begin with a space in history.
setopt HIST_IGNORE_SPACE

# Remove old commands if the history file exceeds its size limit.
setopt HIST_EXPIRE_DUPS_FIRST

aliasrc="/home/adis/.aliasrc"
zshenv="/home/adis/.zshenv"

[[ -f $bashenv ]] && source $bashenv
[[ -f $aliasrc ]] && source $aliasrc

google() {
	w3m https://www.google.com/search?q="$@"
}

autoload -U compinit promptinit
compinit
promptinit; prompt gentoo

zstyle ':completion::complete:*' use-cache 1

source ~/.repos/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(starship init zsh)"
