#!/usr/bin/env bash

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

# Nobody needs to see control sequences when they're hit.
stty -echoctl

# Color is nice
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# We don't need .DS_Store files in our tar archives
export COPY_EXTENDED_ATTRIBUTES_DISABLE=1
export COPYFILE_DISABLE=1

# Erase previous duplicates in the history
export HISTCONTROL=erasedus

# Press ctrl+d twice instead of once to exit the shell
export IGNOREEOF=2

# Allow entering the job name to resume a stopped job
export auto_resume=

# Update the manpath for custom man commands.
export MANPATH=$MANPATH:$HOME/.usr/etc/man

# Make sure anything installed by Brew takes precedence over defaults
export PATH=/usr/local/bin:$PATH

# Add ~/.usr/bin to PATH so that I can use custom commands
export PATH=$HOME/.usr/bin:$PATH

# Do not truncate the history
export HISTFILESIZE=
export HISTSIZE=

# Add a timestamp to the history
export HISTTIMEFORMAT='%D %r :: '

# Don't allow virtualenv to modify the bash prompt.
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Vim is the editor. This is the only choice.
export EDITOR=$(which vim)

if [[ $BASH_VERSION = 4* ]]; then
    source $HOME/.usr/etc/bash4rc
fi

for inc in $HOME/.usr/etc/bash_funcs/*; do
    if [[ -f $inc ]]; then
        source $inc
    fi
done

source $HOME/.usr/etc/bash_alias
source $HOME/.usr/etc/bash_prompt
