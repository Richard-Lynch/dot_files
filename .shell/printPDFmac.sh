#!/bin/bash 

printPDF () {
    vim '+hardcopy > out.ps' +q $1 ; 
    pstopdf out.ps -p
    out="$(echo "$1" | tr '[.]' '_')" 
    \mv out.pdf $out.pdf 
    rm out.ps
}
