#!/bin/bash
#---------------------TMUX---------------------
alias tmux="tmux -2 -u"; 
alias tk="tmux kill-session" ; 
alias tls="tmux ls";
alias tsplit="~/scripts/multiTmux.sh" ;
alias txp="tmux kill-pane -a" ; # kill all other panes in windows
alias txw="tmux kill-window -a"; # kill all other windows in session

#attach to tmux session, or create it
alias ta='tmux new-session -A -s $1'
if [ -f $DOTFILES/bash_completion.d/ta ]; then
. $DOTFILES/bash_completion.d/ta
fi
# switch to session, or create it if nessasary
tmux_switch () {
    tmux switch -t $1 ; 
    if [[ $? == 1 ]] ; then 
        tmux new-session -d -s $1 ; 
        tmux switch -t $1 ; 
    fi ;
}
alias ts='tmux_switch'
if [ -f $DOTFILES/bash_completion.d/ts ]; then
. $DOTFILES/bash_completion.d/ts
fi


