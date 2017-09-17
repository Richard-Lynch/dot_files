#!/bin/bash
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo "bash profile was run"
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=i

#this creates a command which is run after youve typed something but before its run
#export preexec_functions=()
#source ~/.explicit_aliases.sh #if you have an alias for what you just did, itll remind you!

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# DOMENICO's bash
HISTFILE="$HOME/.history"
HISTSIZE=10000
SAVEHIST=10000
export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
shopt -s histverify
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export HISTTIMEFORMAT="%d/%m/%y %T "
alias git="git -c http.sslVerify=false"

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Richie's
alias log="vim *.log.*";
alias lslog="ls *.log.*";
#this line ensure that putty and tmus draw lines between panes
#export LANG=en_US.utf8;

#---------------------Style of Terminal---------------------
bold=$(tput bold)
line=$(tput setab 0)
col=$(tput setaf 227)
# col=$(tput setaf 46) #green
reset=$(tput sgr0)
# export PS1="\[\e[1;32m\]\H\[\e[0m\] :: \[\e[1;30m\]\d\[\e[0m\] \@ :: \[\e[1;33m\]\w\n\[\033[0m\]"
#export PS1='\[$bold\][\w]\$\[$reset\] '
# export PS1="\[${bold}\]\[${col}\]\u @ \w \[${reset}\]" # super small
export PS1="\[${bold}\]\[${col}\][\w]\n$ \[${reset}\]" # super small
# ok so the \[ and \] around the bold and reset, basically tell bash that these values have size 0,so it doesnt 
# grab random old commands and append them on to your PS1 when searching through history
# export PS1="${bold}\w ${reset}" # super small

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# if [ -f /home/rlynch79/.bash_aliases ]; then
  #   . /home/rlynch79/.bash_aliases
# fi

#---------------------SHORTCUTS---------------------
alias v="vim"
alias ba="(cd && vim .bash_profile)"					# opens bash profileb
alias vrc="(cd && vim .vimrc)"  # opens vimrc
alias tco="(cd && vim .tmux.conf)"  #opens tmux.conf
alias agu="sudo apt-get update"
alias agug="sudo apt-get update;sudo apt-get upgrade"
alias agi="sudo apt-get install"
alias bstuff="(cd && vim .bashStuff)"
#---------------------NAVIGATION COMMANDS---------------------
# list files
alias ls="ls -I *.sh~ --color=auto -FG"  #lists file with color and annotation
alias lsa="ls -A"	#lists all including hidden colors etc
alias lsal="ls -lAh" #lists as above + permissions
alias lgrep="ls | grep"
alias lagrep="lsa | grep"
alias lalgrep="lsal | grep"

# els () {
#     egrep -lir "$1" .;
# #     egrep -lir --include=*.log.* "$1" .;
# }
ils () {
    egrep -lir --include=*"$2"* "$1" .;
}

# files
# alias cd="cd -P"    #"follow physical directory structure not sym links" ie show real path, not sym path (rlynch/ not ~/)
alias cp="cp -irv" 	#copys but warns if there will be an override
alias mv="mv -iv"	#moves but warns if there will be an override

# dirs
alias dirs="dirs -v"    #lists the stack vertically with index's
betterpopd () {
    popd +$1 > /dev/null;
    dirs -v;
}
betterpushd () {
    pushd $1 > /dev/null;
    clear;
    ls -A;
    dirs -v;
}
alias pushb="betterpushd" 
alias popb="betterpopd"

alias H="history"
alias h="history 10"  #lists history of commands
alias hls="history 10 | grep"
alias r='fc -s'     #repeats last command which cotnains first arg

# mk
alias mkdir="mkdir -p"     #creates intermediate dirs if required and is verbose
mcdir () {                  #creates a dir and hops into it
    mkdir -p "$1"       ;
    cd "$1"             ;
}

# clears
alias c="clear"   #clear and return home
alias ch="clear && cd"  #clear and return home
alias cb="clear && b"   #clear and returns to build

alias cs="clear && ls"  #clear and ls
alias chs="clear && cd && ls"  #clear and return home and ls
alias cbs="clear && b && ls"   #clear and return to build and ls

alias ca="clear && lsa"   #clear and ls all
alias cha="clear && cd && lsa" #clear and return home and ls all
alias cba="clear && b && lsa"   #clear and return to build and ls all

# cds

cdl () {    #enters dir and lists files inside
    cd "$1"         ;
    clear           ;
    ls              ;
}

cds () {    #enters a dir and lists files inside
    cd "$1"         ;
    ls              ;
}

cda () {   #enters a dir and lists all files inside
    cd "$1"         ;
    lsa             ;
}

# cd
alias ..="cd ../"
alias ...="cd ../../"
alias .2="cd ../../"
alias .3="cd ../../../"
alias .4="cd ../../../../"
alias .5="cd ../../../../../"
alias .6="cd ../../../../../../"

alias ..s="cd ../; ls"
alias ...s="cd ../../; ls"
alias .2s="cd ../../; ls"
alias .3s="cd ../../../; ls"
alias .4s="cd ../../../../; ls"
alias .5s="cd ../../../../../; ls"
alias .6s="cd ../../../../../../; ls"

alias ..la="cd ../; lsa"
alias ...la="cd ../../; lsa"
alias .2la="cd ../../; lsa"
alias .3la="cd ../../../; lsa"
alias .4la="cd ../../../../; lsa"
alias .5la="cd ../../../../../; lsa"
alias .6la="cd ../../../../../../; lsa"


#---------------------tmux utils---------------------
alias tmux="tmux -2 -u"; 
alias tk="tmux kill-session" ; 
alias tls="tmux ls";
alias tsplit="~/scripts/multiTmux.sh" ;

# alias ta="tmux attach -t";
alias ta='tmux attach -t $1'
if [ -f ~/.bash_completion.d/ta ]; then
. ~/.bash_completion.d/ta
fi
# ---- file in ~/.bash_completion.d/ta ----
# _ta() {
#     TMUX_SESSIONS=$(tmux ls -F '#S' | xargs)
# 
#     local cur=${COMP_WORDS[COMP_CWORD]}
#     COMPREPLY=( $(compgen -W "$TMUX_SESSIONS" -- $cur) )
# }
# complete -F _ta ta


#---------------------VIM utils---------------------
alias ycm="~/.vim/bundle/YCM-Generator/config_gen.py -b make ."
alias addMake="cp ~/.make/makefileGeneric ./makefile;" ; 

#---------------------bash utils---------------------
export VISUAL=vim
export EDITOR="$VISUAL"
export CDPATH=:..:~:~/programs
stty -ixon # disable CTRL-S to suspend terminal
# bash source
# Refresh Bash profile, commit and push to github and backup
sb () {                                                         # refresh and backup bash_profile
    (cd                                             ;           # open parenthesis creates subshell to execute from home dir                                                     
    cp -iv ~/.bash_profile ~/.confBackup/bash_backup/bash_profile.backup.$(date +%Y-%m-%d_%H:%M:%S)   ;   # backup bash profile
    cp -iv ~/.tmux.conf ~/.confBackup/tmux_backup/tmux.conf.backup.$(date +%Y-%m-%d_%H:%M:%S) ;     
    cp -iv ~/.vim/vimrc ~/.confBackup/vim_backup/vim.backup.$(date +%Y-%m-%d_%H:%M:%S)   ; 
    )   #outside of the subshell
    source ~/.bash_profile                          ;           # refresh bash_profile
#    echo "sourced bash"
    tmux source ~/.tmux.conf        ;
#    echo "sourced tmux";
    }
alias sbu="source ~/.bash_profile"  #sources bash without backup and stuff

alias timer="echo Press CTL + D to stop timer.; time read;"        ;

create () {         #just creates a quick file
    touch $1        ;
    chmod u+x $1    ;
    vim $1          ;
}

killloads () {
    if [ $# -ne 1 ]
      then
        echo "Incorrect number of arguments supplied"
    else
        ps aux | grep $1
        for pid in $(ps -ef | grep "$1" | awk '{print $2}');
        do
            echo $pid;
        done
        read -p 'are you sure you wanna kill loads? y/n: ' answer
        if [ $answer = "y" ]; then
            echo "gonna kill all your stuff!"
            for pid in $(ps -ef | grep "$1" | awk '{print $2}');
            do
                kill -9 $pid;
            done
        else
            echo "why not?"
            echo $answer
        fi
    fi
    }

alias toprl="top -u rlynch79"
#---------------------GIT---------------------
# git merge Feature-A   //merges Feature-A branch with master branch
# this will not require any commits, but will require a push to the remote
# git branch -d con   //will delete the con lsabranch
# git brnach -l         //will list the local branches
# git push --set-upstream origin test       //create upstream branch of test on remote

alias gcom="git commit -am"		# commits all to git
alias gpush="git push origin"	# pushes all to remote

gbl () {                      #lists the branches
    git branch -l                     ;
}

gch () {            #checks out the branch
    git checkout "$1"               ;
}

gchb () {
    git checkout -b "$1"            ;
}

gadd () {               #creates a file in a git repo, adds it to the repo, commits to local and pushes to remote
    touch "$1"                       ;
    chmod u+x "$1"                  ;
    git add "$1"                      ;
    git commit -am "Created $1"     ;
    git push origin $(git rev-parse --abbrev-ref HEAD);
    vim "$1"                        ;
}
gcp () {
    cp "$1" "$2";
    (
    cd $2;
    git add "$1";
    )
}

# --New Git Repo--
GITUSERNAME="Richard-Lynch"
GitAccessToken=$(< ~/.gitToken)
gnew () {
    # create directory, empty readme    
    mkdir -p "$1" && cd "$1"        ;
    touch readme.txt                ;
    # create local repo
    git init                        ;
    git add .                       ;
    git commit -am "First commit"   ;
    # create remote github repos, adds remote origin, verifys, pushs-
    echo $GitAccessToken
    curl -u $GITUSERNAME:$GitAccessToken https://api.github.com/user/repos -d "{\"name\":\"$1\"}"   ;
    git remote add origin "git@github.com:$GITUSERNAME/$1.git"          ;
#     "git@bbgithub.dev.bloomberg.com:rlynch79/$1.git"                      ;
    git remote -v                   ;
    git push -u origin master       ;
    }
gnewRemote () {
    curl -u $GITUSERNAME:$GitAccessToken https://api.github.com/user/repos -d "{\"name\":\"$1\"}"   ;
}

gclone () {
    git clone $1                    ;
    git checkout -b $2              ;
}

# sets up pre commands for bash, such as mandatory alias
#source ~/.bash-preexe.sh
