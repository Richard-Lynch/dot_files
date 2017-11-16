#!/bin/bash

#---------------------SHORTCUTS---------------------
# programs/commands
alias sbu="source ~/.bash_profile ; tmux source ~/.tmux.conf ; " # source env
alias sb="(\cd ; gcom 'sourcing' ; gpush ) ; sbu" # source and commit
alias rmdi="rm -rf"
alias toprl="top -u rlynch79"
alias pdf="printPDF"
alias v="vim"
alias ycm="~/.vim/bundle/YCM-Generator/config_gen.py -b make ."
alias tag="/usr/local/bin/ctags -R --exclude='.git' . -L .srclist"
alias addMake="cp ~/.make/makefileGeneric ./makefile;" ; 
alias topme="top -U '$(whoami)'"
alias ghci="/usr/local/Cellar/ghc\@8.0/8.0.2/bin/ghci"

# open file
alias bp="(\cd && vim .bash_profile)" # opens bash profile
alias ba="(\cd && vim .bash_aliases)" # opens bash aliases
alias vrc="(\cd && vim .vimrc)"  # opens vimrc
alias tco="(\cd && vim .tmux.conf)"  #opens tmux.conf
alias g="(\cd ~/.shell && vim git.sh)"  #opens tmux.conf
alias bstuff="(\cd && vim .bashStuff)"
alias vstuff="(\cd && vim .vimStuff)"
alias tstuff="(\cd && vim .tmuxStuff)"

# clear, jump to dir, ls
alias c="clear && \ls -AF"
alias h="clear && cd"                     # Home
alias p="clear && pushb $buildLocation"     # Build
alias s="clear && pushb $scriptLocation"    # scripts 
alias t="clear && pushb $testLocation"      # test scripts
alias u="clear && pushb $utilsLocation"     # util scripts
alias e="clear && pushb $envScriptLocation" # env scrips
alias i="clear && pushb $infoLocation"      # info scrips
alias d="clear && pushb $driveLocation"     # drive
alias D="clear && pushb $documentsLocation" # documents
alias E="clear && pushb $engLocation"       # engineering 

# alias c="clear && \ls -A"
# alias h="clear && \cd && \ls -A"                     # Home
# alias p="clear && \cd $buildLocation && \ls -AF"     # Build
# alias s="clear && \cd $scriptLocation && \ls -AF"    # scripts 
# alias t="clear && \cd $testLocation && \ls -AF"      # test scripts
# alias u="clear && \cd $utilsLocation && \ls -AF"     # util scripts
# alias e="clear && \cd $envScriptLocation && \ls -AF" # env scrips
# alias i="clear && \cd $infoLocation && \ls -AF"      # info scrips
# alias d="clear && \cd $driveLocation && \ls -AF"     # drive
# alias D="clear && \cd $documentsLocation && \ls -AF" # documents
# alias E="clear && \cd $engLocation && \ls -AF"       # engineering 

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
alias log="vim *.log.*";
alias lslog="ls *.log.*";

# copy / move
alias cp="cp -irv" 	#copys but warns if there will be an override
alias mv="mv -iv"	#moves but warns if there will be an override

# mk / make dirs
alias mkdir="mkdir -p"     #creates intermediate dirs if required and is verbose
mcdir () {                  #creates a dir and hops into it
    mkdir -p "$1"       ;
    \cd "$1"             ;
}

# cd / go to dir
cd_clear () {       # enters dir, clers, and lists files inside
    if [ $# -ne 1 ] ; then
        pushb ~/    ;
    else
        pushb "$1"  ;
    fi
    # clear           ;
    # \ls -AF         ;
    # dirs
}
cd_back (){
    pushb
}
alias cd="cd_clear" # should repalce cd
alias cb="cd_back" # swap to last
alias cr="popb"
alias cdirs="dirs -\c"

alias ..="cd ../"
alias ...="cd ../../"
alias .2="cd ../../"
alias .3="cd ../../../"
alias .4="cd ../../../../"
alias .5="cd ../../../../../"
alias .6="cd ../../../../../../"

#---------------------TMUX---------------------
alias tmux="tmux -2 -u"; 
alias tk="tmux kill-session" ; 
alias tls="tmux ls";
alias tsplit="~/scripts/multiTmux.sh" ;
alias txp="tmux kill-pane -a" ; # kill all other panes in windows
alias txw="tmux kill-window -a"; # kill all other windows in session

alias ta='tmux attach -t $1'
if [ -f ~/.bash_completion.d/ta ]; then
. ~/.bash_completion.d/ta
fi

alias ts='tmux switch -t $1'
if [ -f ~/.bash_completion.d/ts ]; then
. ~/.bash_completion.d/ts
fi


#---------------------Scripts---------------------
# asm
alias asm="~/scripts/utils/asm.sh"
if [ -f ~/.bash_completion.d/asm ]; then
. ~/.bash_completion.d/asm
fi

alias casm="~/scripts/utils/casm.sh"
if [ -f ~/.bash_completion.d/casm ]; then
. ~/.bash_completion.d/casm
fi

#-------------------Mac---------------------------
alias showHidden='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideHidden='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
