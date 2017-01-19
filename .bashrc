#!/usr/bin/env bash

ssh-add

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
export IGNOREEOF=0

# Allow entering the job name to resume a stopped job
export auto_resume=1

# Set the history size to 10000
export HISTFILESIZE=10000

# Add a timestamp to the history
export HISTTIMEFORMAT='%D %r :: '

alias vim=nvim

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

if which thefuck &> /dev/null; then
    eval $(thefuck --alias)
fi

export GIT_HOOK_GLOBAL_COMMIT_MSG_LINT_ALWAYS_ERROR=1

export PATH=$HOME/dev/js/depot_tools:/opt/chefdk/bin:$HOME/.chefdk/gem/ruby/2.1.0/bin:/opt/chefdk/embedded/bin:$PATH
export GEN_ROOT=/opt/chefdk/embedded/lib/ruby/gems/2.1.0
export GEM_HOME=$HOME/.chefdk/gem/ruby/2.1.0
export GEM_PATH=$HOME/.chefdk/gem/ruby/2.1.0:/opt/chefdk/embedded/lib/ruby/gems/2.1.0
export HOMEBREW_GITHUB_API_TOKEN=23fa2de23d55ae1d03450b238839ca9ce587079d

export PATH="~/.composer/vendor/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

_chef_comp() {
    local COMMANDS="exec env gem generate shell-init install update push push-archive show-policy diff provision export clean-policy-revisions clean-policy-cookbooks delete-policy-group delete-policy undelete verify"
    COMPREPLY=($(compgen -W "$COMMANDS" -- ${COMP_WORDS[COMP_CWORD]} ))
}

complete -F _chef_comp chef

if [[ -f $HOME/.bashlocal ]]; then
    source $HOME/.bashlocal
fi
