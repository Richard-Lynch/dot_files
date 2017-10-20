#!/bin/bash
#---------------------GIT---------------------
# git merge Feature-A   //merges Feature-A branch with master branch
# this will not require any commits, but will require a push to the remote
# git branch -d con   //will delete the con lsabranch
# git brnach -l         //will list the local branches
# git push --set-upstream origin test       //create upstream branch of test on remote

alias gcom="git commit -am"		# commits all to git
alias gc="git commit -a"
alias gpush="git push origin"	# pushes all to remote
alias gp="git push origin"
alias gls="git ls-tree -r master --name-only" # list files tracked by git ( same as "git ls-tree -r master --name-only" )
alias gmv="git mv"

gcp () {
    if [[ $# == 0 ]] ; then
        git commit -a ; 
    elif [[ $# == 1 ]] ; then
        git commit -am "$1" ; 
    else 
        echo "Usage: gcp [commit_message]" ; 
        exit ; 
    fi
    git push origin ; 
}

gm () {
    origf=$(greadlink -f $1)
    gmv $1 ./
    fileName=$(basename $1)
    newf=$(greadlink -f $fileName)
    ln -s $newf $origf
}

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
gCP () {
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
    out="$(echo "$1" | tr '[ ]' '_')"
    # create directory, empty readme    
    mkdir -p "$out" && cd "$out"        ;
    touch readme.txt                ;
    # create local repo
    git init                        ;
    git add .                       ;
    git commit -am "First commit"   ;
    # create remote github repos, adds remote origin, verifys, pushs-
#     echo $GitAccessToken
    curl -u $GITUSERNAME:$GitAccessToken https://api.github.com/user/repos -d "{\"name\":\"$out\"}"   ;
    git remote add origin "git@github.com:$GITUSERNAME/$out.git"          ;
#     "git@bbgithub.dev.bloomberg.com:rlynch79/$out.git"                      ;
    git remote -v                   ;
    git push -u origin master       ;
}

gnewRemote () {
    out="$(echo "$1" | tr '[ ]' '_')"
    curl -u $GITUSERNAME:$GitAccessToken https://api.github.com/user/repos -d "{\"name\":\"$out\"}"   ;
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
    out="$(echo "$repoName" | tr '[ ]' '_')"
    repoName="$out"
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
