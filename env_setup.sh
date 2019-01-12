#!/bin/bash

# This script is currently under consideration, it may be removed completely in favor of several other alternative options.
# Option 1: Manual Copying/Linking -> safe but slow and annoying
# Option 2: Automatic linking of minimum files, and ensure everything else references these files
# Option 3 (best): Create a script that only cats the needed lines into the existing bashrc/bash_profile to source these files correctly

echo "please read comments at top of this file"
exit -1

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac
echo "machine: $machine"

# -- Check if git is installed
# if [ ! -x /usr/bin/git ] ; then
#     echo "Error: Git not installed.\nPlease install git and run again.";
#     exit 1;
# fi

# -- Options to set locations etc
# while getops ":d:b:f:" opt; do
#     case $opt in
#         :)
#             echo "option -$OPTARG requires arg" >&2
#             ;;
#         d)
#             echo "DOTFILES being set to '$DOTFILES'"
#             DOTFILES=$OPTARG
#             ;;
#         b)
#             echo "BACKUP being set to '$OPTARG'"
#             BACKUP=$OPTARG
#             ;;
#         i)
#             echo "ignore filenames being set from file '$OPTARG'"
#             filenames=$(cat $OPTARG)
#             echo "filenames set to '$filenames'"
#             ;;
#         h)
#             echo "home being set to '$OPTARG'"
#             HOMEdir=$OPTARG
#             ;;
#         /?)
#             echo "Invalid Flag '-$OPTARG'"
#             exit 1
#             ;;
#     esac
# done

# TODO respect the above options
HOMEdir=$HOME
DOTFILES="$(pwd)"
BACKUP="$DOTFILES/dot_file_backup_$(date +%Y-%m-%d_%H:%M:%S)/";
# TODO respect ignore files

FILENAMES="$(cd $(pwd) > /dev/null; \ls -A | grep -v --file=.script_ignore )" # mac

echo "DOTFILES: $DOTFILES"
echo "BACKUP: $BACKUP"
echo "HOMEdir: $HOMEdir"
echo "FILENAMES: $FILENAMES"



exit

# ---- Main Copy ----
# mkdir $BACKUP;
# for file in $FILENAMES; do
#     newFile="$DOTFILES/$file"
#     oldFile="$HOME/$file"
#     if [ -w "$oldFile" ] ; then # || [ -d "$oldFile" ] ; then
#         echo "Making backup of \"$oldFile\" in \"$newFile\""
#         mv $oldFile $BACKUP
#     else
#         echo "file \"$oldFile\" doesnt exist"
#     fi
#     echo "linking \"$newFile\" to \"$oldFile\""
#     # TODO should probably be git mv so that the files are still tracked?
#     ln -s $newFile $oldFile
# done

# ---- Special Copy --- 
