#!/bin/bash

makeLocal () {
    firstLine=$(head -n 1 $1)

    if [[ $firstLine == *"#!/"* ]] ; then
        echo "Executable line present: $firstLine"
        exeName=$(basename $firstLine)
        echo "Executable Name: $exeName"
        newExeName=$(which $exeName)
        # newExeName="#!/bin/bash"
        echo "which executeable: $newExeName"
        echo "deleting executeable line"
        sed -i '' '/^#!/ d' $1 ; 
        # add a line to the file if nessasary
        if [ \! -s $1 ] ; then echo "" >> $1 ; echo "added blank line to file" ;  fi ;
        # insert the correct fileString to the top of the file
        echo "adding line"
        gsed -i "1i#!$newExeName" $1 # gsed = gnu-sed ( homebrew! )
    fi
}


