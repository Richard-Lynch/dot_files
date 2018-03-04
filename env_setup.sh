#!/bin/bash

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac
echo "machine: $machine"

# exit 

if [ ! -x /usr/bin/git ] ; then
    echo "Error: Git not installed.\nPlease install git and run again.";
    exit 1;
fi

while getops ":d:b:f:" opt; do
    case $opt in
        :)
            echo "option -$OPTARG requires arg" >&2
            ;;
        d)
            echo "DOTFILES being set to '$DOTFILES'"
            DOTFILES=$OPTARG
            ;;
        b)
            echo "BACKUP being set to '$OPTARG'"
            BACKUP=$OPTARG
            ;;
        i)
            echo "ignore filenames being set from file '$OPTARG'"
            filenames=$(cat $OPTARG)
            echo "filenames set to '$filenames'"
            ;;
        h)
            echo "home being set to '$OPTARG'"
            HOMEdir=$OPTARG
            ;;
        /?)
            echo "Invalid Flag '-$OPTARG'"
            exit 1
            ;;
    esac
done




# TODO option here to set home
HOMEdir=$HOME
DOTFILES="$HOMEdir/dot_files/"
# TODO option here to set backup dir
BACKUP="$HOMEdir/Dot_file_backup_$(date +%Y-%m-%d_%H:%M:%S)/";
# mkdir $BACKUP;
# TODO option here to set ignore files
echo "DOTFILES: $DOTFILES"
echo "BACKUP: $BACKUP"
echo "HOMENAME: $HOMENAME"
echo "FILENAMES: $FILENAMES"
# ---- Main Copy ----
# git clone https://github.com/Richard-Lynch/dot_files.git

# FILENAMES="$(cd ; cd  dot_files/ ; \ls -AI .git)" # linux
FILENAMES="$(cd ; cd  dot_files/ ; \ls -A | grep -v '.git')" # mac
echo $FILENAMES
mkdir $BACKUP;
for file in $FILENAMES; do
    newFile="$DOTFILES$file"
    oldFile="$HOME/$file"
    if [ -w "$oldFile" ] ; then # || [ -d "$oldFile" ] ; then
        echo "Making backup of \"$oldFile\" in \"$newFile\""
        mv $oldFile $BACKUP
    else
        echo "file \"$oldFile\" doesnt exist"
    fi
    echo "Copying \"$newFile\" to \"$oldFile\""
    # TODO should probably be git mv so that the files are still tracked?
    cp -r $newFile $oldFile
done

# ---- Vim ----
echo "doing vim"
ln -s ~/.vim/vimrc ./.vimrc
mkdir -p ~/.vim/.backups ; 
mkdir -p ~/.vim/.swaps ; 
mkdir -p ~/.vim/.undo ; 
cd .vim ;
# clone vundle
mkdir ./bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim ;
vim +PluginInstall +qall ; 
#edit showMarks 
showMarksFile="$HOME/.vim/bundle/ShowMarks/plugin/showmarks.vim" ;
if [ -f $showMarksFile ] ; then
    orig="exe 'sign place '.id.' name=ShowMark'.nm.' line='.ln.' buffer='.winbufnr(0)"
    newl="\
\" changed by Richard Lynch edits file \n\
if ln > 0 \n\
    exe 'sign place '.id.' name=ShowMark'.nm.' line='.ln.' buffer='.winbufnr(0)\n\
endif\n\
\" end of change  by Richard Lynch\
"

    sed -e "s/$orig/$newl/" $showMarksFile > ./tempChangeLineFile ;
    cp $showMarksFile $showMarksFile.bac_$(date +%Y-%m-%d_%H:%M:%S) ; 
    mv ./tempChangeLineFile $showMarksFile ;
else
    echo "ShowMarks file not found!"
    echo $showMarksFile
fi

# youcompleteme
case "${unameOut}" in
    Linux*)     
        machine=Linux
        sudo apt-get install build-essential cmake
        sudo apt-get install python-dev python3-dev
        ;;
    Darwin*)    
        machine=Mac
        brew install python
        brew install python3
        brew install cmake
        ;;
    *)          
        echo "unknown machine, not compiling ycm"
        exit
        ;;
esac

cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer


mv $DOTFILES/.git $HOMEdir/
# git add $FILENAMES
