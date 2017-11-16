#!/bin/bash
# source all files, called in bash_profile
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
thisFile="sourceAll.sh"
# platform specific
if [[ $(uname) == *"Darwin"* ]] ; then
    not_name="linux"
else
    not_name="mac"
fi

# scripts
for f in $HOME/.shell/* ; do
    if [[ -f $f ]] && [[ $f != *"$not_name"* ]] && [[ $f != *"$thisFile"* ]]; then
        source $f
    fi
done

# personal bash completion
for f in ~/.bash_completion.d/* ; do source $f ; done

# bash_aliases
if [[ -f $HOME/.bash_aliases ]] ; then
    . $HOME/.bash_aliases
fi
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
