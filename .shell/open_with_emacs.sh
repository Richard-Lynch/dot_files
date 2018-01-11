#!/usr/bin/env bash

open_emacs () {
    if [[ $# == 1 ]]; then
        file="$1";
    fi

    emacsclient -t $file 2> /dev/null;
    result=$(echo $?);

    if [[ $result == 1 ]] ; then
        echo 'starting emacs server';
        emacs --daemon;
        emacsclient -t $file;
    fi
    }
