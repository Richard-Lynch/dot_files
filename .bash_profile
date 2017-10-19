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
alias log="vim *.log.*";
alias lslog="ls *.log.*";
#this line ensure that putty and tmus draw lines between panes
#export LANG=en_US.utf8;

#---------------------Locations---------------------
buildLocation="~/programs" 
scriptLocation="~/programs/scripts"
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
# alias p="cd $buildLocation ; clear ; ls -A ;"
# alias s="cd $scriptLocation ; clear ; ls -A ;"
alias rmdi="rm -rf"
printPDF () {
    vim '+hardcopy > out.ps' +q $1 ; 
    ps2pdf out.ps
    out="$(echo "$1" | tr '[.]' '_')"
    \mv out.pdf $out.pdf 
    rm out.ps
}
alias pdf="printPDF"
#---------------------NAVIGATION COMMANDS---------------------
# list files
# alias ls="ls --color=auto -FG"  #lists file with color and annotation
alias la="ls -A"	#lists all including hidden colors etc
alias lsa="ls -A"	#lists all including hidden colors etc
alias lsal="ls -lAh" #lists as above + permissions
alias lsgrep="ls | grep"
alias lagrep="lsa | grep"
alias llgrep="lsal | grep"

ils () {
    egrep -lir --include=*"$2"* "$1" .;
}

# files
# alias cd="cd -P"    #"follow physical directory structure not sym links" ie show real path, not sym path (rlynch/ not ~/)
alias cp="cp -irv" 	#copys but warns if there will be an override
alias mv="mv -iv"	#moves but warns if there will be an override

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

alias H="history"
alias h="history 10"  #lists history of commands
alias hls="history | grep -m 10"
alias r='fc -s'     #repeats last command which cotnains first arg

# mk
alias mkdir="mkdir -p"     #creates intermediate dirs if required and is verbose
mcdir () {                  #creates a dir and hops into it
    mkdir -p "$1"       ;
    cd "$1"             ;
}

# clears
# alias c="clear"   #clear and return home
# alias h="clear && cd"  #clear and return home
# alias b="clear && cd $buildLocation"   #clear and returns to build
# alias s="clear && cd $scriptLocation" #clear and returns to scripts

alias c="clear && lsa"  #clear and ls
alias h="clear && cd && lsa"  #clear and return home and ls
alias p="clear && cd $buildLocation && lsa"   #clear and return to build and ls
alias s="clear && cd $scriptLocation && lsa"   #clear and return to build and ls


# cds
cd_clear () {    #enters dir and lists files inside
    if [ $# -ne 1 ]; then
        cd          ;
    else
        cd "$1"     ;
    fi
    clear           ;
    lsa              ;
}

cd_noClear () {    #enters dir and lists files inside
    if [ $# -ne 1 ]; then
        cd          ;
    else
        cd "$1"     ;
    fi
    lsa              ;
}

alias cs="cd_clear" # should repalce cd

# cd
alias ..="cs ../"
alias ...="cs ../../"
alias .2="cs ../../"
alias .3="cs ../../../"
alias .4="cs ../../../../"
alias .5="cs ../../../../../"
alias .6="cs ../../../../../../"

alias ..l="cd ../; ls"
alias ...l="cd ../../; ls"
alias .2l="cd ../../; ls"
alias .3l="cd ../../../; ls"
alias .4l="cd ../../../../; ls"
alias .5l="cd ../../../../../; ls"
alias .6l="cd ../../../../../../; ls"

# alias ..a="cd ../; lsa"
# alias ...a="cd ../../; lsa"
# alias .2a="cd ../../; lsa"
# alias .3a="cd ../../../; lsa"
# alias .4a="cd ../../../../; lsa"
# alias .5a="cd ../../../../../; lsa"
# alias .6a="cd ../../../../../../; lsa"


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

alias ts='tmux switch -t $1'
if [ -f ~/.bash_completion.d/ts ]; then
. ~/.bash_completion.d/ts
fi

alias asm="~/scripts/utils/asm.sh"
if [ -f ~/.bash_completion.d/asm ]; then
. ~/.bash_completion.d/asm
fi
alias casm="~/scripts/utils/casm.sh"
if [ -f ~/.bash_completion.d/casm ]; then
. ~/.bash_completion.d/casm
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
    fileString=""
    addToGit=0
    OPTIND=1
        while getopts ":gbp:-:" opt; do
        case $opt in
            g)
                addToGit=1
                ;;
            b) # -b = bash
                echo "creating bash file" >&2
                fileString="$(which bash)"
                ;;
            p) # -p = python
                case $OPTARG in 
                    2 | 3)
                        echo "creating python $OPTARG file" >&2
                        fileString="$(which python$OPTARG)"
                        ;;
                    *)
                        echo "Invalid python version!"
                        return
                        ;;
                esac
                ;;
            -) # --abitrary
                fileString="$(which $OPTARG)"
                if [[ $fileString == "" ]] ; then
                    echo "$OPTARG not installed"
                    return
                fi
                ;;
            :) # no arg passed
                echo "option -$OPTARG required arg " >&2
                return  
                ;;
            ?) # unknown flag
                echo "unknow flag: $OPTARG" >&2
                return
                ;;
                    esac
    done
    # reset $1 to the first positional argument
    shift $(($OPTIND - 1))
    # if no flag set, then just create a blank file
    if [[ $fileString != "" ]] ; then
        # Delete all leading blank lines at top of file (only).
        sed -i '/./,$!d' $1 ; 
        # add a line to the file if nessasary
        if [ \! -s $1 ] ; then echo "" >> $1 ; echo "added blank line to file" ;  fi ;
        # remove any lines starting with #!
        sed -i '/^#!/ d' $1 ; 
        # insert the correct fileString to the top of the file
        sed -i "1i#!$fileString" $1
    else
        echo "fileString empty" > /dev/null
    fi
    
    touch $1        ;
    chmod u+x $1    ;
    vim $1          ;
    if [[ $addToGit == 1 ]] ; then
        git add $1      ;
        git commit -am "Added $1" ; 
    fi ; 
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
alias gls="git ls-tree -r master --name-only" # list files tracked by git ( same as "git ls-tree -r master --name-only" )
# -- branches -- 
gbls () {                        #lists the branches
    git branch -l                     ;
}

gbch () {                        #checks out the branch
    git checkout "$1"               ;
}

gbnew () {
    git checkout -b "$1"            ;
}

gbdel () {
    git branch -d "$1"              ;
}

# -- files -- 
gadd () {               #creates a file in a git repo, adds it to the repo, commits to local and pushes to remote
    create -g "$@"
#     touch "$1"                       ;
#     chmod u+x "$1"                  ;
#     git add "$1"                      ;
#     git commit -am "Created file"     ;
#     git push origin $(git rev-parse --abbrev-ref HEAD);
#     vim "$1"                        ;
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

# gDelRemote () {
#     curl -X DELETE -H 'Authorization: token $GitAccessToken' https://api.github.com/user/repos/$GITUSERNAME/$1   ;
# }

gnewHere () {
    if [[ $# == 1 ]] ; then
        cd $1                ;
    fi
    git init                        ;
    git add -n .                   ; # show files which would be added 
    while : ; do
        echo -n "Add all of the above files to this new git repo? "
        read yno
        case $yno in 
            [yY] | [yY][eE][sS] )
                echo "Adding all files"
                git add .
                gFinishNew
                break
                ;;
            [nN] | [nN][oO] )
                echo "Not adding any files, add and run 'gFinishNew'"
                return
                break
                ;;
            *)
                echo "invalid option"
                ;;
        esac
    done
}

gFinishNew () {
    repoName=${PWD##*/}
    while : ; do
        echo -n "Finish repo in current dir:$repoName? "
        read yno
        case $yno in 
            [yY] | [yY][eE][sS] )
                echo "Finishing repo"
                break
                ;;
            [nN] | [nN][oO] )
                echo "Not finishing repo."
                return
                ;;
            *)
                echo "invalid option"
                ;;
        esac
    done
    git commit -am "Creating repo from existing dir"
    gnewRemote $repoName
    git remote add origin "git@github.com:$GITUSERNAME/$repoName.git"          ;
    git remote -v                   ;
    git push -u origin master       ;
}

gclone () {
    git clone $1                    ; # clone dir
    temp=$1                         ; # create temp var for dir name
    temp=${temp%.git*}              ; # strip the ".git"
    temp=${temp#*$GITUSERNAME/}     ; # strip everything before the repo-name 
    cd $temp                        ; # enter dir
    if [[ $# == 2 ]] ; then           # if there is a branch passed
        git checkout -b $2          ; # create that branch and swich to it
    fi
    ls -A                           ; # list the contents of the dir
}
# -------------- College -------------------

# sets up pre commands for bash, such as mandatory alias
#source ~/.bash-preexe.sh
