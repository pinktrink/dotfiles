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

