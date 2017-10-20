#!/bin/bash
# source all files, called in bash_profile
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# external files
if [[ -f $HOME/.bash_aliases ]] ; then
    . $HOME/.bash_aliases
fi

if [[ -x $HOME/.vmwareAlias ]] ; then
    . $HOME/.vmwareAlias # connect to VMs
fi

if [[ -x $HOME/.shell/colors.sh ]] ; then
    . $HOME/.shell/colors.sh ; # color settings
fi

if [[ -x $HOME/.shell/printPDF.sh ]] ; then
    . $HOME/.shell/printPDF.sh ; # prints to PDF via vim
fi

if [[ -x $HOME/.shell/create.sh ]] ; then
    . $HOME/.shell/create.sh ; # creates a new file
fi

if [[ -x $HOME/.shell/killLoads.sh ]] ; then
    . $HOME/.shell/killLoads.sh ; # kills all files containing $1
fi

if [[ -x $HOME/.shell/dircolors.sh ]] ; then
    . $HOME/.shell/dircolors.sh ; # kills all files containing $1
fi

if [[ -x $HOME/.shell/git.sh ]] ; then
    . $HOME/.shell/git.sh ; # git utils
fi

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
