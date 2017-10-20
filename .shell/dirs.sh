#!/bin/bash

# not in use!! 

alias dirs="dirs -v"    #lists the stack vertically with index's
alias pushb="betterpushd" 
alias popb="betterpopd"

# better; pop dirs[$1] from stack
betterpopd () {
    popd +$1 > /dev/null;
    dirs -v;
}
# better; push current dir onto stack, and go to arg
betterpushd () {
    pushd $1 > /dev/null;
    clear;
    ls -A;
    dirs -v;
}
