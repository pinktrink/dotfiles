# Attempt to correct mistyped dirs
shopt -s cdspell

# Attempt to expand mistyped dirs
shopt -s dirspell

# Do not attempt to show possibilities for empty lines
shopt -s no_empty_cmd_completion

# Ignore case in globs
shopt -s nocaseglob

# Multi-line commands become single lines
shopt -s cmdhist

# Fancier globbing support
shopt -s extglob

# Allow for ** to match multiple levels of directories
[[ $BASH_VERSION = 4* ]] && shopt -s globstar

# Any time a command has a nonzero exit status, print it
trap 'echo "Exit Status: $?"' ERR

# Color is nice
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# We don't need .DS_Store files in our tar archives
export COPY_EXTENDED_ATTRIBUTES_DISABLE=1
export COPYFILE_DISABLE=1

# Ignore duplicate commands in the command history
export HISTCONTROL=ignoredups

# Update the manpath for custom man commands.
export MANPATH=$MANPATH:$HOME/.man
