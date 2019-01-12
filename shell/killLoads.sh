#!/bin/bash


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
