#!/bin/bash


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
