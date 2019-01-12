#!/bin/bash

rim () {
    user="$1"
    host="$2"
    path="$3" #( // absollute path, / relative )
    command1="scp://$user@$host$path"
    echo $command1
    mvim -v $command1
}

demo_rim () {
    user="ubuntu" # "$1"
    host="ec2-54-154-93-7.eu-west-1.compute.amazonaws.com" # $2
    path="//home/ubuntu/IntApps_ChatServ/" # "$3" ( // absollute path, / relative )
    rim $user $host $path
}

mac_rim () {
    if [[ $# == 1 ]]; then
        file="$1"
    else
        file="test_script.sql"
    fi
    user="lynchri"
    host="macneill.scss.tcd.ie"
    path="//users/ugrad/lynchri/$file"
    echo $path
    rim $user $host $path
}
