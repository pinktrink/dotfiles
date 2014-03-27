#!/usr/bin/env bash

source $HOME/.dotfiles/all.sh/rc

for inc in $HOME/.dotfiles/bash/funcs/*; do
    if [[ -f $inc ]]; then
        source $inc
    fi
done

# Attempt to correct mistyped dirs
shopt -s cdspell

# Do not attempt to show possibilities for empty lines
shopt -s no_empty_cmd_completion

# Ignore case in globs
shopt -s nocaseglob

# Multi-line commands become single lines
shopt -s cmdhist

# Fancier globbing support
shopt -s extglob

# Append history rather than overwriting it
shopt -s histappend

# Erase previous duplicates in the history
export HISTCONTROL=erasedups

# Press ctrl+d twice instead of once to exit the shell
export IGNOREEOF=2

# Allow entering the job name to resume a stopped job
export auto_resume=1

# Set the history size to 10000
export HISTFILESIZE=10000

# Add a timestamp to the history
export HISTTIMEFORMAT='%D %r :: '

# Macros
# ctrl+g to run git status
bind -x '"\C-g":"git status"' 2> /dev/null

# ctrl+o to reload .bashrc
bind -x '"\e\C-r":"bash ~/.bashrc"' 2> /dev/null

if [[ $BASH_VERSION = 4* ]]; then
    source $HOME/.dotfiles/bash/bash4rc
fi

use colors

PROMPT_USER_NORMAL="$pink"
PROMPT_DIR_INHOME="$bold $pink"
PROMPT_PROMPT_NORMAL="$bold $pink"
PROMPT_EXIT_ZERO="$pink"
PROMPT_REPO_FILECHANGE_GOOD="$bold $pink"
PROMPT_REPO_INSERTION="$pink"
PROMPT_REPO_NO_CHANGE="$dim $pink"
PROMPT_BATTERY_GOOD="$bold $pink"
PROMPT_BATTERY_CHARGED="$bold $pink"

source $HOME/.dotfiles/bash/alias
source $HOME/.dotfiles/bash/prompt

source $HOME/.dotfiles/bash/afterrc
