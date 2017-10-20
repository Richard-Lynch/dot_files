#!/bin/bash

#---------------------SHORTCUTS---------------------
# programs/commands
alias v="vim"
alias sbu="source ~/.bash_profile ; tmux source ~/.tmux.conf ; " # source env
alias sb="(cd ; gcom 'sourcing' ; gpush ) ; sbu" # source and commit
alias rmdi="rm -rf"
alias toprl="top -u rlynch79"

# files
alias ba="(cd && vim .bash_profile)" # opens bash profile
alias vrc="(cd && vim .vimrc)"  # opens vimrc
alias tco="(cd && vim .tmux.conf)"  #opens tmux.conf
alias bstuff="(cd && vim .bashStuff)"
alias vstuff="(cd && vim .vimStuff)"
alias tstuff="(cd && vim .tmuxStuff)"

# clear
alias c="clear && lsa"  #clear and ls
alias h="clear && cd && lsa"  #clear and return home and ls
alias p="clear && cd $buildLocation && lsa"   #clear and return to build and ls
alias s="clear && cd $scriptLocation && lsa"   #clear and return to build and ls

# apt-get
alias agud="sudo apt-get update"
alias agug="sudo apt-get update;sudo apt-get upgrade"
alias agi="sudo apt-get install"
alias bi="brew install"


# history
alias H="history 10"  #lists history of commands
alias hls="fc -lr -1000 | grep -m 10" # finds 10 last uses of $1 in 1000 commands
alias r='fc -s'     #repeats last command which cotnains first arg


#---------------------NAVIGATION COMMANDS---------------------
# ls / list
alias ls="ls -F"  #lists file with color and annotation
alias la="ls -AF"	#lists all including hidden colors etc
alias lsa="ls -AF"	#lists all including hidden colors etc
alias lsal="ls -lAhF" #lists as above + permissions
alias lsgrep="ls | grep" # list and grep output
alias lagrep="lsa | grep" # list all and grep output 
alias llgrep="lsal | grep" # list all with details and grep output
ils () { # list files that include string $1, and have a name which contains $2(opt)
    egrep -lir --include=*"$2"* "$1" .;
}
alias log="vim *.log.*";
alias lslog="ls *.log.*";

# copy / move
alias cp="cp -irv" 	#copys but warns if there will be an override
alias mv="mv -iv"	#moves but warns if there will be an override

# mk / make dirs
alias mkdir="mkdir -p"     #creates intermediate dirs if required and is verbose
mcdir () {                  #creates a dir and hops into it
    mkdir -p "$1"       ;
    cd "$1"             ;
}

# cd / go to dir
cd_clear () {       # enters dir, clers, and lists files inside
    if [ $# -ne 1 ] ; then
        cd          ; else
        cd "$1"     ;
    fi
    clear           ;
    lsa             ;
}

cd_noClear () {     # enters dir and lists files inside
    if [ $# -ne 1 ] ; then
        cd          ; else
        cd "$1"     ;
    fi
    lsa             ;
}

alias cs="cd_clear" # should repalce cd

alias ..="cs ../"
alias ...="cs ../../"
alias .2="cs ../../"
alias .3="cs ../../../"
alias .4="cs ../../../../"
alias .5="cs ../../../../../"
alias .6="cs ../../../../../../"


#---------------------tmux utils---------------------
alias tmux="tmux -2 -u"; 
alias tk="tmux kill-session" ; 
alias tls="tmux ls";
alias tsplit="~/scripts/multiTmux.sh" ;

alias ta='tmux attach -t $1'
if [ -f ~/.bash_completion.d/ta ]; then
. ~/.bash_completion.d/ta
fi

alias ts='tmux switch -t $1'
if [ -f ~/.bash_completion.d/ts ]; then
. ~/.bash_completion.d/ts
fi


#---------------------scripts---------------------
# asm
alias asm="~/scripts/utils/asm.sh"
if [ -f ~/.bash_completion.d/asm ]; then
. ~/.bash_completion.d/asm
fi

alias casm="~/scripts/utils/casm.sh"
if [ -f ~/.bash_completion.d/casm ]; then
. ~/.bash_completion.d/casm
fi


