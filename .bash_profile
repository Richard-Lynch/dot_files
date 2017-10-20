#!/bin/bash
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo "bash profile was run"
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=i
if [ -x /usr/local/bin/mvim ] ; then
    alias vim="/usr/local/bin/mvim -v"
fi
if [ -x ~/.vmwareAlias ] ; then
    source ~/.vmwareAlias
fi
#this creates a command which is run after youve typed something but before its run
# export preexec_functions=()
# source ~/.explicit_aliases.sh #if you have an alias for what you just did, itll remind you!
#testing to see if move worked
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# DOMENICO's bash
HISTFILE="$HOME/.history"
HISTSIZE=10000
SAVEHIST=10000
export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
shopt -s histverify
# adds cmd and refresh history after every command
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export HISTTIMEFORMAT="%d/%m/%y %T "
alias git="git -c http.sslVerify=false"

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Richie's
    # alias log="vim *.log.*";
    # alias lslog="ls *.log.*";
#this line ensure that putty and tmus draw lines between panes
#export LANG=en_US.utf8;

#---------------------Locations---------------------
buildLocation="~/programs" 
scriptLocation="~/programs/scripts"
#---------------------Style of Terminal---------------------
source ~/.shell/colors.sh
export PS1="\[${bold}\]\[${yellow}\][\w]\[${grey}\][\u : \h]\n\[${yellow}\]$ \[${reset}\]" # super small
# enable color support of ls and also add handy aliases
# mac
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
# linux?
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

if [ -f $HOME/.bash_aliases ]; then
    . $HOME/.bash_aliases
fi
if [[ -x ~/.shell/printPDF.sh ]] ; then
    . ~/.shell/printPDF.sh ; 
fi

# dirs
alias dirs="dirs -v"    #lists the stack vertically with index's
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
alias pushb="betterpushd" 
alias popb="betterpopd"


#---------------------bash env---------------------
export VISUAL=vim # default editor is vim
export EDITOR="$VISUAL"
export CDPATH=:..:~:~/programs # search each of these paths for autocomplete
stty -ixon # disable CTRL-S to suspend terminal
# alias timer="echo Press CTL + D to stop timer.; time read;"        ;

if [[ -x ~/.shell/create.sh ]] ; then
    . ~/.shell/create.sh ; 
fi

if [[ -x ~/.shell/killLoads.sh ]] ; then
    . ~/.shell/killLoads.sh ; 
fi

if [[ -x ~/.shell/git.sh ]] ; then
    . ~/.shell/git.sh ; 
fi
# sets up pre commands for bash, such as mandatory alias
#source ~/.bash-preexe.sh
