#!/bin/bash
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo "bash profile was run"
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=i
# externals
if [[ -x $HOME/.shell/sourceAll.sh ]] ; then
    . $HOME/.shell/sourceAll.sh ; 
fi

# defaults
export VISUAL=vim # default editor is vim
export EDITOR="$VISUAL"
if [ -x /usr/local/bin/mvim ] ; then
    alias vim="/usr/local/bin/mvim -v"
fi

# options
export CDPATH=:..:~:~/programs # search each of these paths for autocomplete
stty -ixon # disable CTRL-S to suspend terminal
alias git="git -c http.sslVerify=false"
export CLICOLOR=1 # supports color
export LSCOLORS=ExFxBxDxCxegedabagacad # color selection

# history
HISTFILE="$HOME/.history" # location
HISTSIZE=10000
SAVEHIST=10000
export HISTCONTROL=ignoreboth:erasedups # no dupes, keep clean
export HISTTIMEFORMAT="%d/%m/%y %T "
shopt -s histappend # dont override history
shopt -s histverify # ??? TODO

# prompt
export PS1="\[${bold}\]\[${yellow}\][\w]\[${grey}\][\u : \h]\n\[${yellow}\]$ \[${reset}\]" # super small
export PROMPT_COMMAND="history -a; history -c; history -r;" # append, clear, refresh

# locations
buildLocation="~/programs" 
scriptLocation="~/programs/scripts"

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
