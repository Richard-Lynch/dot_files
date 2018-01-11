#!/usr/local/bin/bash

condition="$1"
action="$2"
second="$3"

for f in ./* ; do 
    if [[ -f $f ]]; 
        if [[ "$f" == $condition ]] ; then 
            $action "$f" $second; 
        fi; 
    fi;  
done

