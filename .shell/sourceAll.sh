#!/bin/bash
# source all files, called in bash_profile
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# external files
if [[ -f $HOME/.bash_aliases ]] ; then
    . $HOME/.bash_aliases
fi

if [[ -x $HOME/.shell/.vmwareAlias ]] ; then
    . $HOME/.shell/.vmwareAlias # connect to VMs
fi

if [[ -x $HOME/.shell/colors.sh ]] ; then
    . $HOME/.shell/colors.sh ; # color settings
fi

if [[ -x $HOME/.shell/lsAlias.sh ]] ; then
    . $HOME/.shell/lsAlias.sh ; # ls alias settings
fi

# platform specific
if [[ $(uname) == *"Darwin"* ]] ; then
    if [[ -x $HOME/.shell/printPDFmac.sh ]] ; then
        . $HOME/.shell/printPDFmac.sh ; # prints to PDF via vim
    fi
    if [[ -x $HOME/.shell/whichEditorMac.sh ]] ; then
        . $HOME/.shell/whichEditorMac.sh ; # prints to PDF via vim
    fi
else
    if [[ -x $HOME/.shell/printPDF.sh ]] ; then
        . $HOME/.shell/printPDF.sh ; # prints to PDF via vim
    fi
    if [[ -x $HOME/.shell/whichEditorLinux.sh ]] ; then
        . $HOME/.shell/whichEditorLinux.sh ; # prints to PDF via vim
    fi
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
