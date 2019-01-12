#!/usr/local/bin/bash
do_if(){
    echo "in the func"
    action="$1"
    condition="$2"
    second="$3"

    for f in ./* ; do
        echo "in loop"
        echo $f
        if [[ -f $f ]]; then
            echo "is a file"
            echo $condition
            if [[ "$f" == *"$condition"* ]] ; then
                echo "meets condition"
                $action "$f" $second;
            fi;
        fi;
    done
}
