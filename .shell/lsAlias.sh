#!/bin/bash

alias ls="ls -F"  #lists file with color and annotation
alias la="ls -AF"	#lists all including hidden colors etc
alias ll="ls -lAhF" #lists as above + permissions
# alias lsa="ls -AF"	#lists all including hidden colors etc
# alias lsal="ls -lAhF" #lists as above + permissions

genericLsGrep () { 
    flags=$1
    inner=$2
    shift 2
    if [[ $# == 1 ]] ; then
        \ls $flags | $inner grep "$1" ; 
    else 
        echo "Pass only the string to be searched for"
    fi
}

lsg () {
    genericLsGrep '' '' "$@"
}
lag () {
    genericLsGrep -A '' "$@"
}
llg () {
    genericLsGrep -lAh '' "$@"
}
ilsg () {
    genericLsGrep '' xargs "$@"
}
ilag () {
    genericLsGrep -A xargs "$@"
}
