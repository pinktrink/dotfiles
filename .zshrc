#!/usr/bin/env/zsh

source $HOME/.dotfiles/all.sh/rc

for inc in $HOME/.dotfiles/zsh/funcs/*; do
    if [[ -f $inc ]]; then
        source $inc
    fi
done

bindkey -e

# Automatically push the directory on top of the stack and ignore duplicates
setopt autopushd
setopt pushd_ignoredups

# Append the history, don't overwrite it
setopt append_history

# Show a timestamp and time it took to run a command in the history
setopt extended_history

# Remove older duplicates in the history
setopt hist_ignore_alldups
setopt hist_save_no_dups

# Allow entering the job name to resume a stopped job
setopt auto_resume

# Actually enable history
export SAVEHIST=$HISTSIZE
export HISTFILE="$HOME/.zsh_history"

source $HOME/.dotfiles/zsh/alias
source $HOME/.dotfiles/zsh/prompt

source $HOME/.dotfiles/zsh/afterrc
