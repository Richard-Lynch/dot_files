#!/bin/bash
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo "bash profile was run"
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=i
# locations
buildLocation="~/programs" 
scriptLocation="~/programs/scripts"
utilsLocation="~/programs/scripts/utils"
testLocation="~/programs/tests"
envScriptLocation="~/.shell/"
infoLocation="~/info/"
driveLocation="~/Drive/"
documentsLocation="~/Drive/Documents/"
engLocation="~/Engineering"

# externals
if [[ -x $HOME/.shell/sourceAll.sh ]] ; then
    echo "sourcing all"
    . $HOME/.shell/sourceAll.sh ; 
fi

# defaults
export VISUAL=vim # default editor is vim
export EDITOR="$VISUAL"
if [ -x /usr/local/bin/mvim ] ; then
    alias vim="/usr/local/bin/mvim -v"
    export VISUAL="/usr/local/bin/mvim -v" # default editor is vim
    export EDITOR="/usr/local/bin/mvim -v"
fi

# options
export CDPATH=:..:~:~/programs # search each of these paths for autocomplete
stty -ixon # disable CTRL-S to suspend terminal
alias git="git -c http.sslVerify=false"
export CLICOLOR=1 # supports color
export LSCOLORS=ExFxBxDxCxegedabagacad # color selection
# export PYTHONPATH="/Library/Frameworks/Python.framework/Versions/3.6/lib/python3.6/"
# export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Applications/VMware Fusion.app/Contents/Library:/Applications/VMware Fusion.app/Contents/Library"

# history
HISTFILE="$HOME/.history" # location
HISTSIZE=10000
SAVEHIST=10000
export HISTCONTROL=ignoreboth:erasedups # no dupes, keep clean
export HISTTIMEFORMAT="%d/%m/%y %T "
shopt -s histappend # dont override history
shopt -s histverify # ??? TODO
export HOMEBREW_GITHUB_API_TOKEN="~/.gitToken"
# prompt
export PS1="\[${bold}\]\[${yellow}\][\w]\[${grey}\][\u : \h]\n\[${yellow}\]$ \[${reset}\]" # super small
export PROMPT_COMMAND="history -a; history -c; history -r;" # append, clear, refresh

# enable bash completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
