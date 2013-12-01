bindkey -v

for inc in $HOME/.usr/etc/bash_funcs/*; do
    if [[ -f $inc ]]; then
        source $inc
    fi
done

source $HOME/.usr/etc/zprompt
