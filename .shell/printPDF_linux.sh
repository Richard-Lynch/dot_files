#!/bin/bash 

printPDF () {
    vim '+hardcopy > out.ps' +q $1 ; 
    ps2pdf out.ps
    out="$(echo "$1" | tr '[.]' '_')"
    \mv out.pdf $out.pdf 
    rm out.ps
}
