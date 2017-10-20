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
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
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

if [ -f $HOME/.bash_aliases ]; then
    . $HOME/.bash_aliases
fi
if [[ -x ~/.shell/printPDF.sh ]] ; then
    . ~/.shell/printPDF.sh ; 
fi

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
