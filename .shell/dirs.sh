#!/bin/bash

# better; pop dirs[$1] from stack
betterpopd () {
    popd +$1 > /dev/null;
    dirs -v -l;
}
# better; push current dir onto stack, and go to arg
# or, if +N , bring N dir from top to top of stack by rotating
# or, if -N , bring N dir from bot to top of stack by rotating
betterpushd () {
    pushd $1 > /dev/null;
    clear;
    ls -A;
    dirs -v -l;
}


alias dirs="dirs -v -l"    #lists the stack vertically with index's, in long form
alias pushb="betterpushd" 
alias popb="betterpopd"
