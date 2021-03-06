#!/bin/bash

# if [ -x /usr/local/bin/mvim ] ; then
#     alias vim="/usr/local/bin/mvim -v"
#     export EDITOR="/usr/local/bin/mvim -v"
# fi

create () {         #just creates a quick file
    # echo "in create"
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
                fileStringLeader="#!"
                ;;
            p) # -p = python
                case $OPTARG in 
                    2 | 3)
                        echo "creating python $OPTARG file" >&2
                        fileString="$(which python$OPTARG)"
                        fileStringLeader="#!"
                        ;;
                    *)
                        echo "Invalid python version!"
                        return
                        ;;
                esac
                ;;
            -) # --abitrary
                fileString="$(which $OPTARG)"
                fileStringLeader="#!"
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
    filename="$1"
    # create/touch a blank file
    touch $filename        ;
    chmod u+x $filename    ;

    # if filestring was not set by flag, check if known extension
    if [[ $fileString == "" ]] ; then
        # echo "fileString empty"
        extension="${filename##*.}"
        if [[ $extension == "py" ]] ; then
            echo "python extension found!"
            PY_DEFAULT="3"
            fileString="$(which python$PY_DEFAULT)"
            fileStringLeader="#!"
        elif [[ $extension == "sh" ]] ; then
            echo "bash extension found!"
            fileString="$(which bash)"
            fileStringLeader="#!"
        elif [[ $extension == "org" ]] ; then
            echo "org extension found!"
            fileString="TODO: TODO RUNNING BACK IDEA | DONE CANCELED"
            fileStringLeader="#+"
        else
            echo "unknown extension found!" > /dev/null
        fi
    fi
    # if filestring was set, add hash-bang
    if [[ $fileString != "" ]] ; then
        # Delete all leading blank lines at top of file (only).
        sed -i '' '/./,$!d' $filename ; 
        # add a line to the file if nessasary
        if [ \! -s $filename ] ; then echo "" >> $filename ; echo "added blank line to file" ;  fi ;
        # remove any lines starting with #!
        sed -i '' '/^'$fileStringLeader'/ d' $filename ; 
        # insert the correct fileString to the top of the file
        fileString="$fileStringLeader$fileString"
        # echo "at the adding line stage"
        # echo "fileString: $fileString"
        # the next echo is functional!!
        echo "$fileString
            $(cat $filename)" > $filename
        # echo "it worked"
        # gsed -i "1$fileString" $filename # gsed = gnu-sed ( homebrew! )
    else
        echo "fileString empty" > /dev/null
    fi
    
    # if git flag, add to git
    if [[ $addToGit == 1 ]] ; then
        git add $filename      ;
    fi ; 
    # open file in vim
    env $EDITOR $filename          ;
    # if git flag, commit to git after editing
    if [[ $addToGit == 1 ]] ; then
        git commit -am "Added $filename" ; 
    fi ; 
}
